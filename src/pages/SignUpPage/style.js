import styled from "styled-components";

export const WrapperContainer = styled.div`
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
  background-color: #4CAF50; 
  font-family: Arial, sans-serif;
`;

export const WrapperForm = styled.div`
  background-color: #fff;
  border-radius: 8px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
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
    color: #333;
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
    color: #333;
  }

  input {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
    font-size: 16px;
  }
`;

export const WrapperButton = styled.button`
  background-color: #4CAF50; 
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  font-size: 16px;
  width: 100%;
  margin-top: 15px;

  &:hover {
    background-color: #45a049; 
  }
`;

export const WrapperTextLight = styled.div`
  text-align: center;
  margin-top: 15px;

  a {
    color: #333;
    text-decoration: none;
  }

  a:hover {
    text-decoration: underline;
  }
`;