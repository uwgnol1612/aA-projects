import React from 'react'

class BenchIndex extends React.Component {

    componentDidMount() {
        // this.props.requestBenches();
    }

    render() {

        const benches = this.props.benches.map(bench => 
        <li key={bench.id}>{bench.description}</li>)

        return (
            <div>
                {benches}
            </div>
        )


    }
}

export default BenchIndex;