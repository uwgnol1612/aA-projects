import React from 'react';

class Headers extends React.Component {
    render() {
        const tabIdx = this.props.idx;
        const headers = this.props.tabs.map((tab, idx) => {
            const title = tab.title;
            const active = idx === tabIdx ? "active" : "";

            return (
                <li
                    key = {idx}
                    className = {active}
                    onClick = {() => this.props.selectedTab(idx)}>
                    {title}   
                </li>
            );
        })
        return (
            <ul className = "tab-header">
                {headers}
            </ul>
        );
    }
}


    
class Tabs extends React.Component {
    constructor(props) {
        super(props);
        this.state = { tabIdx: 0 };
        this.setTab = this.setTab.bind(this);
    }

    setTab(idx) {
        this.setState({tabIdx: idx})
    }

    render() {
        const tabs = this.props.tabs
        const tab = tabs[this.state.tabIdx];

        return (
            <div>
                <h1>Tabs</h1>
                <div className = 'tabs'>
                <Headers idx={this.state.tabIdx}
                    selectedTab={this.setTab}
                    tabs={this.props.tabs}/>
                    <div className = 'tab-content'>
                        <article>
                            {tab.content}
                        </article>
                    </div>  
                </div>
            </div> 
        );
    }
}
export default Tabs;


