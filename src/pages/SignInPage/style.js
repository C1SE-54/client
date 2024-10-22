import styled from "styled-components";

// Định nghĩa biến màu sắc
const colors = {
  primary: '#4CAF50',
  primaryHover: '#45a049',
  background: '#fff',
  text: '#333',
  border: '#ccc',
  shadow: 'rgba(0, 0, 0, 0.1)',
};

export const WrapperContainer = styled.div`
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
  background-color: ${colors.primary}; /* Màu nền xanh lá */
  font-family: Arial, sans-serif;
`;

export const WrapperForm = styled.div`
  background-color: ${colors.background};
  border-radius: 8px;
  box-shadow: 0 2px 4px ${colors.shadow};
  padding: 30px;
  width: 350px;
  max-width: 100%;
`;

export const WrapperTitle = styled.div`
  text-align: center;
  margin-bottom: 20px;

  h1 {
    font-size: 24px;
    font-weight: bold;
    margin-bottom: 10px;
    color: ${colors.text};
  }

  p {
    font-size: 16px;
    color: #666;
  }
`;

export const WrapperInput = styled.div`
  margin-bottom: 15px;

  label {
    display: block;
    margin-bottom: 5px;
    font-weight: bold;
    color: ${colors.text};
  }

  input {
    width: 100%;
    padding: 10px;
    border: 1px solid ${colors.border};
    border-radius: 4px;
    box-sizing: border-box;
    font-size: 16px;
  }
`;

export const WrapperButton = styled.button`
  background-color: ${colors.primary}; 
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  font-size: 16px;
  width: 100%;
  margin-top: 15px;

  &:hover {
    background-color: ${colors.primaryHover}; 
  }
`;

export const WrapperTextLight = styled.div`
  text-align: center;
  margin-top: 15px;
  font-size: 13px;
  color: ${colors.text};
  cursor: pointer;
`;

// export const WrapperGoogleBtn = styled.div`
//   margin-top: 15px;
//   display: flex;
//   justify-content: center;
//   align-items: center;
//   background-color: ${colors.background};
//   padding: 10px;
//   border: 1px solid ${colors.border};
//   border-radius: 4px;
//   cursor: pointer;
//   width: 100%;

//   span {
//   font - size: 13px;
//   color: ${ colors.text };
// }
// `;