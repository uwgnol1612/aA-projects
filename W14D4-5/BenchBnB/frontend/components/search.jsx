import React from 'react';
import BenchIndex from './bench_index'
import BenchMap from './bench_map'

const Search = ({benches, requestBenches, updateFilter}) => {
    // debugger
    return (
    <div>
        <BenchIndex benches={benches} requestBenches={requestBenches}/>
        <BenchMap benches={benches} updateFilter={updateFilter} />
    </div>
    )
}

export default Search;