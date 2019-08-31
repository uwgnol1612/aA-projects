import { logoutUser } from "../actions/session_actions";
import { connect } from 'react-redux';
import Greeting from './greeting';


const mapStateToProps = (state) => {
  return {
    currentUser: state.entities.users[state.session.id]
  } 
};

const mapDispatchToProps = (dispatch) => ({
  logout: () => dispatch(logoutUser())
})


export default connect(mapStateToProps, mapDispatchToProps)(Greeting);