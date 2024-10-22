import styled from "styled-components";

export const WrapperMenu = styled.div`
  width: 100%; /* Chiếm toàn bộ chiều rộng màn hình */
  background-color: #A50034; /* Màu nền của thanh menu */
  padding: 10px 0; /* Padding trên và dưới */
  box-sizing: border-box; /* Đảm bảo padding không ảnh hưởng đến chiều rộng 100% */
`;

export const WrapperMenuItems = styled.div`
  max-width: 1200px; /* Giới hạn chiều rộng tối đa của nội dung bên trong */
  margin: 0 auto; /* Canh giữa nội dung trong menu */
  display: flex;
  justify-content: space-between; /* Căn đều các mục */
  padding: 0 20px; /* Thêm khoảng cách cho nội dung trong menu */
`;
