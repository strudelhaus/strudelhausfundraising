import { combineReducers } from 'redux';
import { USER_ACTIONS } from '../actions/userActions';

const userName = (state = null, action) => {
  switch (action.type) {
    case USER_ACTIONS.SET_USER:
      return action.user.username || state;
    case USER_ACTIONS.UNSET_USER:
      return null;
    default:
      return state;
  }
};

const isLoading = (state = false, action) => {
  switch (action.type) {
    case USER_ACTIONS.REQUEST_START:
      return true;
    case USER_ACTIONS.REQUEST_DONE:
      return false;
    default:
      return state;
  }
};

const userRole = (state = 'customer', action) => {
  switch (action.type) {
    case USER_ACTIONS.SET_ROLE:
      return action.user.role || state;
    case USER_ACTIONS.UNSET_ROLE:
      return 'customer';
    default:
      return state;
  }
}
export default combineReducers({
  userName,
  isLoading,
  userRole,
});
