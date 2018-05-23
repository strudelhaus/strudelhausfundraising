import React, { Component } from 'react';
import { connect } from 'react-redux';

class AddCampaignForm extends Component {
    constructor(props){
        super(props);
        this.state = ({
            newCampaign: {
                organization_id: '',
                name: '',
                url: '',
                info_url: '',
                notes: '',
                date_start: '',
                date_end: '',
                goal: '',
                product1: '',
                product2: ''
            }
        });
    };

    addCampaign = (event) => {
        event.preventDefault();
        console.log(this.state.newCampaign);
        
        this.props.dispatch({
            type: 'ADD_CAMPAIGN',
            payload: this.state.newCampaign
        })
        // Clear input fields after dispatching
        this.setState({
            newCampaign: {
                organization_id: '',
                name: '',
                url: '',
                info_url: '',
                notes: '',
                date_start: '',
                date_end: '',
                goal: '',
                product1: '',
                product2: ''
            }
        })
    };

    // Capture user inputs so we can store in our local state
    handleInput = (propertyName) => {
        return (event) => {          
            // Set state as the previous state + the updated given property added by the user
            this.setState({
                newCampaign: {
                    ...this.state.newCampaign,
                    [propertyName]: event.target.value,
                }
            })
        }
    }

    render(){
        return(
            <div>
                <h4>Add Campaign</h4>
                <form id="addCampForm">
                    <input value={this.state.newCampaign.organization_id} placeholder="Organization" onChange={this.handleInput("organization_id")}/>
                    <input value={this.state.newCampaign.name} placeholder="Campaign Name" onChange={this.handleInput("name")}/>
                    <input value={this.state.newCampaign.url} placeholder="Campaign URL" onChange={this.handleInput("url")}/>
                    <input value={this.state.newCampaign.info_url} placeholder="Info URL" onChange={this.handleInput("info_url")}/>
                    <input value={this.state.newCampaign.notes} placeholder="Notes" onChange={this.handleInput("notes")}/>
                    <input value={this.state.newCampaign.date_start} placeholder="Start Date" onChange={this.handleInput("date_start")}/>
                    <input value={this.state.newCampaign.date_end} placeholder="End Date" onChange={this.handleInput("date_end")}/>
                    <input value={this.state.newCampaign.goal} placeholder="Sales Goal ($)" onChange={this.handleInput("goal")}/>
                    <input value={this.state.newCampaign.product1} placeholder="Product 1" onChange={this.handleInput("product1")}/>
                    <input value={this.state.newCampaign.product2} placeholder="Product 2" onChange={this.handleInput("product2")}/>
                    <button type="submit" onClick={this.addCampaign}>Create!</button>
                </form>
            </div>
        )
    }
}

const mapReduxStateToProps = reduxState => ({
    user: reduxState.user,
    reduxState
});

// this allows us to use <App /> in index.js
export default connect(mapReduxStateToProps)(AddCampaignForm);