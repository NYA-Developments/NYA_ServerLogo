const logoContainer = document.getElementById('logo-container');
const logoImage = document.getElementById('server-logo');

let currentOpacity = 0.8;

const applyPosition = (position, offsetX, offsetY) => {
    logoContainer.className = '';
    
    const positions = {
        'top': () => logoContainer.style.top = `${offsetY}px`,
        'bottom': () => logoContainer.style.bottom = `${offsetY}px`,
        'left': () => logoContainer.style.left = `${offsetX}px`,
        'right': () => logoContainer.style.right = `${offsetX}px`,
        'center-v': () => {
            logoContainer.style.top = '50%';
            logoContainer.style.transform = logoContainer.style.transform 
                ? logoContainer.style.transform + ' translateY(-50%)' 
                : 'translateY(-50%)';
        },
        'center-h': () => {
            logoContainer.style.left = '50%';
            logoContainer.style.transform = logoContainer.style.transform 
                ? logoContainer.style.transform + ' translateX(-50%)' 
                : 'translateX(-50%)';
        }
    };
    
    const parts = position.split('-');
    
    parts.forEach(part => {
        if (part === 'center' && parts.length === 1) {
            positions['center-v']();
            positions['center-h']();
        } else if (part === 'center') {
            positions['center-h']();
        } else if (positions[part]) {
            positions[part]();
        }
    });
};

const setupLogo = (data) => {
    logoImage.style.width = `${data.width}px`;
    logoImage.style.height = `${data.height}px`;
    
    applyPosition(data.position, data.offsetX, data.offsetY);
    
    currentOpacity = data.opacity;
    
    const transitionDuration = data.duration / 1000;
    logoContainer.style.transition = `opacity ${transitionDuration}s ${data.easing}`;
};

const setVisibility = (visible) => {
    logoContainer.style.opacity = visible ? currentOpacity : '0';
    logoContainer.style.visibility = visible ? 'visible' : 'hidden';
};

window.addEventListener('message', (event) => {
    const data = event.data;
    
    switch(data.action) {
        case 'setup':
            setupLogo(data);
            break;
        case 'toggle':
        case 'visibility':
            setVisibility(data.visible);
            break;
    }
});
