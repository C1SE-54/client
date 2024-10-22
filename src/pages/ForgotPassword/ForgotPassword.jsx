import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import {
    WrapperContainer,
    WrapperForm,
    WrapperTitle,
    WrapperInput,
    WrapperTextLight
} from './style'; // Import các thành phần được tạo kiểu
import InputForm from '../../components/InputForm/InputForm';
import ButtonComponent from '../../components/ButtonComponent/ButtonComponent';

const ForgotPassword = () => {
    const [email, setEmail] = useState('');
    const navigate = useNavigate(); // Khởi tạo useNavigate

    const handleOnchangeEmail = (e) => {
        setEmail(e.target.value);
    };

    const handleSendCode = () => {
        // console.log('Email:', email);
        navigate('/resetpassword');
        // Thêm logic xử lý gửi mã tại đây, ví dụ như gọi API
    };

    const handleNavigateSignIn = () => {
        navigate('/sign-in'); // Điều hướng đến trang đăng nhập
    };

    return (
        <WrapperContainer>
            <WrapperForm>
                <WrapperTitle>
                    <h1>Lấy mã</h1>
                </WrapperTitle>
                <WrapperInput>
                    <InputForm
                        placeholder="Địa chỉ email của bạn"
                        value={email}
                        onChange={handleOnchangeEmail}
                    />
                </WrapperInput>
                <ButtonComponent
                    disabled={!email.length}
                    onClick={handleSendCode} // Sử dụng hàm handleSendCode
                    styleButton={{
                        background: 'rgb(255, 57, 69)',
                        width: '300px',
                        height: '45px',
                        border: 'none',
                        borderRadius: '4px'
                    }}
                    textButton={'Lấy mã'} // Đổi nhãn nút thành "Lấy mã"
                    styleTextButton={{ color: '#fff', fontSize: '15px', fontWeight: '700' }}
                />
                <WrapperTextLight onClick={handleNavigateSignIn}>
                    Quay lại trang Đăng nhập
                </WrapperTextLight>
            </WrapperForm>
        </WrapperContainer>
    );
};

export default ForgotPassword;