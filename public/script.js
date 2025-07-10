// DOM elements
const helloBtn = document.getElementById('helloBtn');
const contactForm = document.getElementById('contactForm');
const responseBox = document.getElementById('response');

// Utility function to update response box
function updateResponse(message, type = 'default') {
    responseBox.innerHTML = `<p>${message}</p>`;
    responseBox.className = `response-box ${type}`;
}

// Handle hello button click (client-side only)
helloBtn.addEventListener('click', () => {
    helloBtn.disabled = true;
    helloBtn.textContent = 'Hello!';
    
    // Simulate a brief delay for better UX
    setTimeout(() => {
        updateResponse('Hello from the client! This is a pure Node.js app with no dependencies.', 'success');
        helloBtn.disabled = false;
        helloBtn.textContent = 'Say Hello to Server';
    }, 500);
});

// Handle form submission (client-side only)
contactForm.addEventListener('submit', (e) => {
    e.preventDefault();
    
    const formData = new FormData(contactForm);
    const submitBtn = contactForm.querySelector('button[type="submit"]');
    
    submitBtn.disabled = true;
    submitBtn.textContent = 'Submitting...';
    
    // Simulate form processing
    setTimeout(() => {
        const name = formData.get('name');
        const email = formData.get('email');
        const message = formData.get('message');
        
        updateResponse(`Form submitted successfully! Received: ${name}, ${email}, "${message}"`, 'success');
        contactForm.reset();
        
        submitBtn.disabled = false;
        submitBtn.textContent = 'Submit';
    }, 1000);
});

// Add some interactive effects
document.addEventListener('DOMContentLoaded', () => {
    // Add loading animation to buttons
    const buttons = document.querySelectorAll('.btn');
    buttons.forEach(button => {
        button.addEventListener('click', function() {
            if (!this.disabled) {
                this.style.transform = 'scale(0.95)';
                setTimeout(() => {
                    this.style.transform = '';
                }, 150);
            }
        });
    });
    
    // Add focus effects to form inputs
    const inputs = document.querySelectorAll('input, textarea');
    inputs.forEach(input => {
        input.addEventListener('focus', function() {
            this.parentElement.style.transform = 'translateX(5px)';
        });
        
        input.addEventListener('blur', function() {
            this.parentElement.style.transform = '';
        });
    });
    
    console.log('Pure Node.js + HTML App loaded successfully!');
    console.log('No dependencies, no build process, just pure web development!');
}); 