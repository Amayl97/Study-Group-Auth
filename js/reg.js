const form = document.getElementById("form");
const errorMsg = document.getElementById("error");

form.addEventListener("submit", function(e) {
    const name = document.getElementById("name").value.trim();
    const email = document.getElementById("email").value.trim();
    const password = document.getElementById("password").value;

    errorMsg.style.display = "none";

    // Name validation
    if(name.length < 3) {
        e.preventDefault(); 
        errorMsg.style.display = "block";
        errorMsg.innerText = "Enter a valid name";
        return;
    }

    // Email validation
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if(!emailRegex.test(email)) {
        e.preventDefault();
        errorMsg.style.display = "block";
        errorMsg.innerText = "Enter a valid email";
        return;
    }

    // Password validation
    if(password.length < 8 || !/[A-Za-z]/.test(password) || !/[0-9]/.test(password)) {
        e.preventDefault();
        errorMsg.style.display = "block";
        errorMsg.innerText = "Password must contain letters and numbers";
        return;
    }

    
});
