import React from 'react';

class Clock extends React.Component {
    constructor(props) {
        super(props);
        this.state = { time: new Date()};
        this.tick = this.tick.bind(this);
    }

    componentDidMount() {
        this.intervalId = setInterval(this.tick, 1000);
    }

    componentWillUnmount() {
        clearInterval(this.intervalId); 
    }

    tick() {
        this.setState({time: new Date() });
    }

    render() {
        const { time } = this.state
        return (
            <div>
                <div>
                    <h1>Clock</h1>
                    <div className="clock">
                        <p>
                            <span>Time: </span>
                            <span>
                                {time.getHours()}: {time.getMinutes()}: {time.getSeconds()} PDT
                            </span> 
                        </p>
                        <p>
                            <span>Date:</span>
                            <span>
                                {time.toDateString()}
                            </span>
                        </p>
                    </div>
                </div>
                
            </div>
        );

    }
}

export default Clock;