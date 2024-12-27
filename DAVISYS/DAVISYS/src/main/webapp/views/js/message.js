const container_message = document.querySelector(".container_message"),
    clearfix = container_message.querySelector(".people-list .clearfix"),
    messageNull = container_message.querySelector(".message-null");
    close_mess = container_message.querySelector(".close_mess");
    clearfix.addEventListener("click", () => {
    container_message.classList.add("active");
    messageNull.style.display = 'none';
});

close_mess.addEventListener("click", () => {
    container_message.classList.remove("active");
    messageNull.style.display = 'block';
});
function previewImage(event) {
    const file = event.target.files[0];
    if (file) {
        const reader = new FileReader();
        reader.onload = function() {
            // Hiển thị ảnh đã chọn
            const imagePreview = document.createElement('img');
            imagePreview.src = reader.result;
            imagePreview.style.width = '100px'; // Bạn có thể điều chỉnh kích thước
            document.querySelector('.footer-chat').appendChild(imagePreview);
        };
        reader.readAsDataURL(file);
    }
}
