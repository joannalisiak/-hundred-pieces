export const effect = () => {
    const heart = document.querySelector("#heart");
    if (heart) {
        heart.addEventListener("click", () => {
            heart.style.color="red";
        });
    }
};