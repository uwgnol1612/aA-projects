import { loginUser } from '../actions/session_actions';
import { connect } from 'react-redux';
import SessionForm from './session_form';



const mapStateToProps = (state, ownProps) => ({
  errors: state.errors,
  formType: 'login'

})

const mapDispatchToProps = (dispatch) => ({
  processForm: (user) => dispatch(loginUser(user))
})

export default connect(mapStateToProps, mapDispatchToProps)(SessionForm);