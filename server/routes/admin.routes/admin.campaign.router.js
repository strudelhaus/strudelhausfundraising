const express = require('express');
const pool = require('../../modules/pool');
const { rejectUnauthenticated } = require('../../modules/authentication-middleware');
const router = express.Router();

/**
 * GET route template
 */
router.get('/', (req, res) => {
    if (req.isAuthenticated()) {
    //checking if user is authenticated
        (async()=>{
        //creates async function
            const client = await pool.connect();
            // await will wait for a return on the fiven function and then do something
                try {
                    await client.query('BEGIN') // tells DB to be ready for multiple lines of queries
                    let campaignPageArray = [];
                    let queryText = `SELECT
                        organization.name as organization_name,
                        organization.contact_name,
                        organization.id as organization_id
                        FROM organization;`
                    let organizationResult = await client.query(queryText)
                    let organizationRowsResult = organizationResult.rows;

                    for (let i = 0; i < organizationRowsResult.length; i++) {                        
                        let queryText2 = `SELECT
                            campaign.name as campaign_name,
                            campaign.id as campaign_id,
                            campaign.date_start,
                            campaign.date_end,
                            campaign.goal
                            FROM campaign
                            WHERE organization_id = $1;`
                        let campaignResult = await client.query(queryText2, [organizationRowsResult[i].organization_id]);
                        let campaignRowsResult = campaignResult.rows;
                        for (let i = 0; i < campaignRowsResult.length; i++) {
                            campaignRowsResult[i].goal = Number(campaignRowsResult[i].goal.replace(',',''))
                            let queryText3 = `SELECT
                                SUM("order".quantity) as item_total,
                                product.name as product_name,
                                product.price
                                FROM "order" 
                                JOIN available_item ON "order".available_item_id = available_item.id
                                JOIN product ON available_item.product_id = product.id
                                WHERE available_item.campaign_id = $1
                                GROUP BY product.name, product.price
                                ORDER BY product.name asc;`
                            let totalSales = 0
                            let orderResult = await client.query(queryText3, [campaignRowsResult[i].campaign_id]);
                            for (let i = 0; i < orderResult.rows.length; i++) {
                                orderResult.rows[i].price = Number(orderResult.rows[i].price);
                                orderResult.rows[i].item_total = Number(orderResult.rows[i].item_total)
                                orderResult.rows[i].productSales = orderResult.rows[i].price * orderResult.rows[i].item_total;
                            }                                                      
                            campaignRowsResult[i].productList = orderResult.rows                            
                            campaignPageArray.push(campaignRowsResult[i])
                            // console.log('campaignRowsResult', campaignRowsResult);
                        };//end for loop                        
                    };//end for loop
                    await client.query('COMMIT');
                    res.send(campaignPageArray)
                } catch (error) {
                    console.log('ROLLBACK', error);
                    await client.query('ROLLBACK');
                    throw error;
                } finally {
                    client.release();
                    //will end connection to database
                };// end try/catch
        })().catch((error)=>{
            console.log('CATCH',error);
            res.sendStatus(500);
        })//end async
    }else{
        res.sendStatus(403)
    };//end if/else
});//end router.post

/**
 * POST route template
 */
router.post('/', (req, res) => {
    if (req.isAuthenticated()) {
    //checking if user is authenticated
        (async()=>{
        //creates async function
            const client = await pool.connect();
            //await will wait for a return on the given function and then do whatever follows
                try {
                    await client.query('BEGIN')
                    let queryText = `INSERT INTO campaign (organization_id,url,"name",date_start,date_end,notes,info_url,goal) VALUES ($1,$2,$3,$4,$5,$6,$7,$8) RETURNING "id"`
                    const campaignResult = await client.query(queryText, [req.body.organization_id, req.body.url, req.body.name, req.body.date_start, req.body.date_end, req.body.notes, req.body.info_url, req.body.goal]);
                    const campaignId = campaignResult.rows[0].id
                    for (let i = 0; i < req.body.products.length; i++) {
                        let productId = req.body.products[i];
                        let queryText2 = `INSERT INTO available_item (campaign_id,product_id) VALUES ($1,$2)`
                        await client.query(queryText2,[campaignId,req.body.products[i]]);
                    };//end for loop for adding available products to each campaign
                    await client.query('COMMIT');
                    res.sendStatus(201);
                } catch (error) {
                    console.log('ROLLBACK', error);
                    await client.query('ROLLBACK');
                    throw error;
                } finally {
                    client.release();
                    //will release the server from the database
                };//end try/catch
        })().catch((error)=>{
            console.log('CATCH', error);
            res.sendStatus(500);
        });//end async function
    } else {
        res.sendStatus(403);
    };//end if/else for authentication
});//end router.post

module.exports = router;