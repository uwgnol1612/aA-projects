import { connect } from 'react-redux';
import { requestBenches } from '../actions/bench_actions'
import Search from './search';
import { updateFilter, updateBounds } from '../actions/filter_actions'


const mapStateToProps = (state) => {

    return {    
        benches: Object.values(state.entities.benches)
    }
}

const mapDispatchToProps = (dispatch) => ({
    requestBenches: () => dispatch(requestBenches()),
    // updateBounds: (bounds) => dispatch(updateBounds(bounds)),
    updateFilter: (bounds) => dispatch(updateFilter(bounds))
})

export default connect(mapStateToProps, mapDispatchToProps)(Search);