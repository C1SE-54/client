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

const ResetPassword = () => {
    const navigate = useNavigate(); // Khởi tạo useNavigate
    const handleNavigateSignIn = () => {
        navigate('/sign-in'); // Điều hướng đến trang đăng nhập
    };
    const [password, setPassword] = useState('');
    const [confirmPassword, setConfirmPassword] = useState('');
    return (
        <WrapperContainer>
            <WrapperForm>
                <WrapperTitle>Đặt lại mật khẩu</WrapperTitle>
                <WrapperInput>
                    <InputForm
                        placeholder="Nhập mã code"
                    />
                </WrapperInput>
                <WrapperInput>
                    <InputForm placeholder="Nhập mật khẩu mới" type="password"
                        id="password"
                        value={password}
                        onChange={(e) => setPassword(e.target.value)} />
                </WrapperInput>

                <WrapperInput>
                    <InputForm placeholder="Nhập lại mật khẩu" type="password"
                        id="confirm-password"
                        value={confirmPassword}
                        onChange={(e) => setConfirmPassword(e.target.value)} />
                    {/* <label htmlFor="confirm-password">Nhập lại mật khẩu:</label> */}
                </WrapperInput>
                <ButtonComponent
                    // disabled={!email.length}
                    onClick={handleNavigateSignIn} // Sử dụng hàm handleSendCode
                    styleButton={{
                        background: 'rgb(255, 57, 69)',
                        width: '300px',
                        height: '45px',
                        border: 'none',
                        borderRadius: '4px'
                    }}
                    textButton={'Đổi mật khẩu'} // Đổi nhãn nút thành "Lấy mã"
                    styleTextButton={{ color: '#fff', fontSize: '15px', fontWeight: '700' }} />
            </WrapperForm>
        </WrapperContainer>
    );
};
export default ResetPassword