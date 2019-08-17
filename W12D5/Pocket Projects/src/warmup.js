
const partyHeader = document.getElementById('party');

export const htmlGenerator = (string, htmlElement) => {
    const newP = document.createElement('p');
    newP.innerHTML = string;
    if (Array.from(htmlElement.children).length === 0) {
        htmlElement.appendChild(newP);
    }
    else {
        htmlElement.removeChild(htmlElement.firstChild);
        htmlElement.appendChild(newP);
    }    
};

htmlGenerator('Party Time.', partyHeader);