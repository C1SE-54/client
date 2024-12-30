const url = 'http://localhost:8080';
let stompClient = null;
let selectedUser = null;
let newMessages = new Map();
let image = null;

function connectToChat(userName) {
    console.log("connecting to chat...")
    console.log("Username: " + userName)
    let socket = new SockJS(url + '/chat');
    stompClient = Stomp.over(socket);
    stompClient.connect({}, function (frame) {
        console.log("connected to: " + frame);
        stompClient.subscribe("/topic/messages/" + userName, function (response) {
            let data = JSON.parse(response.body);
            console.log("data_fromlogin1: " + data.img);
            if (selectedUser === data.fromLogin) {
                render(data.message, data.fromLogin, data.img);
            } else {
                newMessages.set(data.fromLogin, data.message, data.img);
                let unreadCountElement = $('#newMessage_' + data.fromLogin);
                if (unreadCountElement.length) {
                    let currentCount = parseInt(unreadCountElement.text(), 10) || 0;
                    unreadCountElement.text(currentCount + 1);
                } else {
                    $('#userNameAppender_' + data.fromLogin).append('<span class="countMessages" id="newMessage_' + data.fromLogin + '">1</span>');
                }

            }
        });

        stompClient.subscribe("/topic/public", function (response) {
            let data = JSON.parse(response.body);
            let usersTemplateHTML = "";
            let username = $('#userName').val();
            let unreadMessages = JSON.parse(localStorage.getItem('unreadMessages')) || {};
            for (let key of Object.keys(data)) {
                let online = "";
                let timeOff = "";
                let count = "";
                let value = data[key];
                if (key != username) {
                    if (value.type === 'JOIN') {
                        online = '<div class="online"></div>';
                    } else {
                        // Kiểm tra số tin nhắn chưa đọc của người dùng này từ dữ liệu lưu trữ
                        if (value.messageUnRead > 0) {
                            count = value.messageUnRead;
                            // Lưu số tin nhắn chưa đọc vào localStorage
                            unreadMessages[key] = value.messageUnRead;
                        } else {
                            // Nếu không có tin nhắn chưa đọc, xóa khỏi bộ nhớ lưu trữ
                            delete unreadMessages[key];
                        }
                    }
                        timeOff = '<div class="timer">12 sec</div>';
                    usersTemplateHTML = usersTemplateHTML + '<a href="#"  onclick="selectUser(\'' + key + '\')"><div class="discussion">' +
                        '<div class="photo"  id="userNameAppenderImg_' + key +
                        '" style="background-image: url(' + value.image + ');">' + online +
                        '</div>' +
                        '<div class="desc-contact">' +
                        '<p id="userNameAppender_' + key + '" class="name">' + value.fullName + '<span class="countMessages badge">' + (count || "") + '</span>' + '</p>' +
                        '<p class="message">' + value.lastMessage + '</p>' +
                        '</div>' + timeOff +
                        '</div></a>';
                    console.log("Message content:", value.lastMessage);

                }

            }
            localStorage.setItem('unreadMessages', JSON.stringify(unreadMessages));
            $('#usersList').html(usersTemplateHTML);
        });
        stompClient.send("/app/fetchAllUsers");

    });
    window.event.preventDefault();
}

function sendMsg(from, text, img) {
    stompClient.send("/app/chat/" + selectedUser, {}, JSON.stringify({
        fromLogin: from,
        message: text,
        img: img
    }));
    insertData(from, text);
}

function registration(userName) {
    $.ajax({
        url: url + "/registration/" + userName,
        type: "get",
        data: {
            userName: userName
        },
        success: function (data) {
            connectToChat(userName);
        },
        error: function (xhr) {
            alert("error")
        }

    })
}

function selectUser(userName) {
    let userLogin = document.getElementById('userName').value;
    selectedUser = userName;
    // let fullName = document.getElementById("userNameAppender_" + userName).textContent.trim();
    let fullNameElement = document.getElementById("userNameAppender_" + userName);
    let fullName = fullNameElement.childNodes[0].textContent.trim();
    image = document.getElementById("userNameAppenderImg_" + userName).style.backgroundImage.slice(5, -2);
    let isNew = document.getElementById("newMessage_" + userName) !== null;
    if (isNew) {
        let element = document.getElementById("newMessage_" + userName);
        element.parentNode.removeChild(element);
        render(newMessages.get(userName), userName, image);
    }
    document.querySelectorAll(".message ,.time").forEach((e) => {
        e.remove();
    })
    userFromLoginCustom = userLogin;
    userToLoginCustom = selectedUser;
    createChats(userLogin, userName);

    $('#selectedUserId').html('');
    $('#selectedUserImageId').html('');
    $('#selectedUserImageId').append('<div class="photo"' +
        ' style="background-image: url(' + image + ');">' +
        '<div class="online"></div>' +
        '</div>');
    $('#selectedUserId').append('<p class="name">' + fullName + '</p>');
}

function createChats(userLogin, userName) {
    let chatName = userName;
    $.ajax({
        url: url + "/createChats/" + chatName,
        type: "get",
        data: {
            fromLogin: userLogin,
            toUser: userName,
        },
        success: function (data) {
            if (data != null) {
                $chatHistory.append(data);
            }
        },
        error: function (xhr) {
            alert("error")
        }

    })
}
