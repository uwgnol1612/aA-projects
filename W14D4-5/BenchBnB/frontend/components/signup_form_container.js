import { signupUser } from '../actions/session_actions';
import { connect } from 'react-redux';
import SessionForm from './session_form';

const mapStateToProps = (state, ownProps)  => ({
  errors: state.errors,
  formType: 'signup'

})

const mapDispatchToProps = (dispatch) => ({
  processForm: (user) => dispatch(signupUser(user))
})

export default connect(mapStateToProps,mapDispatchToProps)(SessionForm);