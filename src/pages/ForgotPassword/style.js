// style.js
import styled from 'styled-components';

export const WrapperContainer = styled.div`
  display: flex;
  align-items: center;
  justify-content: center;
  width: 100vw;
  height: 100vh;
  background: linear-gradient(to right, #2f855a, #38a169);
  margin: 0;
  padding: 20px;
  box-sizing: border-box;
  

`;

export const WrapperForm = styled.div`
  background-color: #ffffff;
  padding: 2rem;
  border-radius: 8px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  width: 100%;
  max-width: 400px; /* Đảm bảo form không quá rộng trên màn hình lớn */
  box-sizing: border-box;
`;

export const WrapperTitle = styled.h1`
  font-size: 1.75rem;
  font-weight: 700;
  margin-bottom: 1.5rem;
  color: #333333;
  text-align: center;
`;


export const WrapperInput = styled.div`
  margin-bottom: 15px;

  label {
    display: block;
    margin-bottom: 5px;
    font-weight: bold;
    color: #333;
  }

  input {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 15px;
    box-sizing: border-box;
    font-size: 16px;
    
  }
`;

export const WrapperTextLight = styled.p`
  text-align: center;
  margin-top: 1.5rem;
  color: #718096;
  cursor: pointer;
  transition: color 0.3s ease;

  &:hover {
    color: #2f855a;
  }
`;