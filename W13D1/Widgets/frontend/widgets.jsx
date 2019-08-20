import React from 'react';
import ReactDOM from 'react-dom';

import Clock from './clock';
import Tabs from './tabs';


function Root() {
  const tabs = [
    {title: "one", content: "i am the first"}, 
    {title: "two", content: "Second pane here"}, 
    {title: "three", content: "Third pane here"}
  ];
  return(
    <div>
      <h1><Clock /></h1>
      <h1><Tabs tabs = {tabs}/></h1>
    </div>
  );
}
document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root");
  ReactDOM.render(<Root/>, root);
});
