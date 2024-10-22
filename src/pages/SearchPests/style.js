import styled from 'styled-components';

// Tạo một container bao quanh trang
export const Container = styled.div`
    display: flex;
    flex-direction: column;
    align-items: center;
    padding: 20px;
    background-color: #f4f4f4;
    min-height: 100vh;
`;

// Form để tải lên file
export const Form = styled.form`
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 15px;
    margin-bottom: 20px;
`;

// Input chọn ảnh
export const Input = styled.input`
    padding: 10px;
    border: 2px solid #ccc;
    border-radius: 5px;
    cursor: pointer;
`;

// Nút bấm để phân tích ảnh
export const Button = styled.button`
    background-color: #4caf50;
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    font-size: 16px;
    cursor: pointer;
    
    &:hover {
        background-color: #45a049;
    }
`;

// Phần preview ảnh đã chọn
export const Preview = styled.div`
    margin-top: 20px;
    text-align: center;
`;

// Hình ảnh được preview
export const Image = styled.img`
    max-width: 300px;
    max-height: 300px;
    border-radius: 10px;
    box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
`;

// Hiển thị trạng thái đang phân tích
export const LoadingText = styled.p`
    font-size: 18px;
    font-weight: bold;
    color: #ff9800;
    margin-top: 20px;
`;

// Kết quả phân tích
export const Results = styled.div`
    margin-top: 20px;
    text-align: center;
    background-color: #fff;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
    max-width: 400px;
    width: 100%;
`;

// Text cho kết quả
export const ResultText = styled.p`
    font-size: 16px;
    color: #333;
    margin: 5px 0;
`;
