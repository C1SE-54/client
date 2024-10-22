import styled from 'styled-components';

export const FooterWrapper = styled.footer`
  background-color: #333;
  color: #fff;
  padding: 20px;
  text-align: center;
  width: 100%;
  bottom: 0;
  left: 0;
  position: relative;
  
  // Đảm bảo nội dung bên trong không quá nhỏ trên màn hình nhỏ
  font-size: 14px;
  
  p {
    margin: 0;
  }

  // Đảm bảo footer không bị chèn vào nội dung chính và luôn nằm ở đáy khi trang không đủ nội dung
  /* @media (min-height: 600px) {
    position: fixed;
  } */

  // Tạo hiệu ứng hover (nếu có liên kết hoặc văn bản)
  a {
    color: #fff;
    text-decoration: underline;
    &:hover {
      color: rgb(13, 92, 182);
    }
  }
`;
