import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { EyeFilled, EyeInvisibleFilled } from '@ant-design/icons';
import {
  WrapperContainer,
  WrapperTextLight,
  WrapperForm,
  WrapperInput,
  WrapperTitle,
} from './style';
import InputForm from '../../components/InputForm/InputForm';
import ButtonComponent from '../../components/ButtonComponent/ButtonComponent';

const SignInPage = () => {
  const navigate = useNavigate();
  const [isShowPassword, setIsShowPassword] = useState(false);
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');

  const handleNavigateSignUp = () => {
    navigate('/sign-up');
  };

  const handleNavigateHome = () => {
    navigate('/home'); // Sử dụng đường dẫn tương đối chính xác
  };

  const handleNavigateForgotPassword = () => {
    navigate('/forgotpassword'); // Sử dụng đường dẫn tương đối chính xác
  };

  const handleOnchangeEmail = (e) => {
    setEmail(e.target.value);
  };

  const handleOnchangePassword = (e) => {
    setPassword(e.target.value);
  };

  const handleSignIn = () => {
    console.log('Email, password: ', email, password);
    // Thêm logic xử lý đăng nhập tại đây, ví dụ như gọi API
    handleNavigateHome(); // Điều hướng đến trang chủ sau khi đăng nhập thành công
  };

  return (
    <WrapperContainer>
      <WrapperForm>
        <WrapperTitle>
          <h1>Đăng Nhập</h1>
        </WrapperTitle>
        <WrapperInput>
          <label htmlFor="email">Địa chỉ email:</label>
          <InputForm
            placeholder="abc@gmail.com"
            value={email}
            onChange={handleOnchangeEmail}
          />
        </WrapperInput>
        <WrapperInput>
          <label htmlFor="password">Mật khẩu:</label>
          <div style={{ position: 'relative' }}>
            <InputForm
              placeholder="password"
              type={isShowPassword ? 'text' : 'password'}
              value={password}
              onChange={handleOnchangePassword}
            />
            <span
              onClick={() => setIsShowPassword(!isShowPassword)}
              style={{
                zIndex: 10,
                position: 'absolute',
                top: '4px',
                right: '8px',
                marginLeft: '5px',
                cursor: 'pointer'
              }}
            >
              {isShowPassword ? <EyeFilled /> : <EyeInvisibleFilled />}
            </span>
          </div>
        </WrapperInput>
        <ButtonComponent
          disabled={!email.length || !password.length}
          onClick={handleSignIn}
          styleButton={{
            background: 'rgb(255, 57, 69)',
            width: '300px',
            height: '45px',
            border: 'none',
            borderRadius: '4px'
          }}
          textButton={'Đăng nhập'}
          styleTextButton={{ color: '#fff', fontSize: '15px', fontWeight: '700' }}
        />
        <WrapperTextLight onClick={handleNavigateForgotPassword}>
          Quên mật khẩu? Nhấn vào đây
        </WrapperTextLight>
        <p>
          <WrapperTextLight onClick={handleNavigateSignUp}>
            Bạn chưa có tài khoản? Đăng ký
          </WrapperTextLight>
        </p>
      </WrapperForm>
    </WrapperContainer>
  );
};

export default SignInPage;