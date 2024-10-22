import React, { useState } from 'react';
import { Badge, Col } from 'antd';
import { WrapperTextHeader, WrapperHeader, WrapperHeaderAccount, WrapperTextHeaderSmall } from './style';
import ButtonInputSearch from '../ButtonInputSearch/ButtonInputSearch';
import { UserOutlined, CaretDownOutlined, ShoppingCartOutlined } from '@ant-design/icons';
import { useNavigate } from 'react-router-dom';

const HeaderComponent = () => {
  const [selectedLanguage, setSelectedLanguage] = useState("VietNam");
  const [isDropdownVisible, setIsDropdownVisible] = useState(false);
  const navigate = useNavigate();

  const handleNavigateLogin = () => {
    navigate('/sign-in');
  };
 
  const handleLanguageChange = (language) => {
    setSelectedLanguage(language);
    setIsDropdownVisible(false); // Ẩn dropdown sau khi chọn ngôn ngữ
  };

  const toggleDropdown = () => {
    setIsDropdownVisible(prev => !prev); // Toggle trạng thái dropdown
  };

  return (
    <div style={{ width: '100%', backgroundColor: '#1A94E1', padding: '10px 20px' }}>
      <WrapperHeader gutter={16} style={{ alignItems: 'center', display: 'flex', justifyContent: 'space-between' }}>
        {/* Logo and Title */}
        <Col span={6} style={{ display: 'flex', alignItems: 'center' }}>
          <WrapperTextHeader style={{ fontSize: '28px', fontWeight: 'bold', color: '#ffffff' }}>
            AgriGenius
          </WrapperTextHeader>
        </Col>

        {/* Search Input */}
        <Col span={10} style={{ display: 'flex', justifyContent: 'center' }} >
          <ButtonInputSearch
            size="large"
            textButton="Tìm kiếm"
            bordered="false"
            placeholder="Search for farming tips..."
            style={{
              width: '100%',
              borderRadius: '20px',
              boxShadow: '0px 4px 10px rgba(0, 0, 0, 0.1)',
              maxWidth: '600px'
            }}
          />
        </Col>

        {/* Account and Cart Section */}
        <Col span={8} style={{ display: 'flex', justifyContent: 'flex-end', alignItems: 'center', gap: '40px' }}>
          {/* Account Section */}
          <WrapperHeaderAccount style={{ display: 'flex', alignItems: 'center', gap: '10px', cursor: 'pointer' }} onClick={handleNavigateLogin}>
            <UserOutlined style={{ fontSize: '30px', color: '#ffffff' }} />
            <div style={{ textAlign: 'left' }}>
              <WrapperTextHeaderSmall style={{ color: '#ffffff' }}>Đăng nhập/Đăng ký</WrapperTextHeaderSmall>
              <div style={{ display: 'flex', alignItems: 'center' }}>
                <WrapperTextHeaderSmall style={{ color: '#ffffff' }}>Tài khoản</WrapperTextHeaderSmall>
                <CaretDownOutlined style={{ color: '#ffffff', marginLeft: '5px' }} />
              </div>
            </div>
          </WrapperHeaderAccount>

          {/* Shopping Cart */}
          <div style={{ display: 'flex', flexDirection: 'column', alignItems: 'center', color: '#ffffff', cursor: 'pointer' }}>
            <Badge count={5} size="small">
              <ShoppingCartOutlined style={{ fontSize: '30px', color: '#ffffff' }} />
            </Badge>
            <WrapperTextHeaderSmall style={{ color: '#ffffff', marginTop: '4px' }}>Giỏ hàng</WrapperTextHeaderSmall>
          </div>

          {/* Language Dropdown */}
          <div style={{ position: 'relative', display: 'inline-block' }}>
            <div
              style={{ cursor: 'pointer', display: 'flex', alignItems: 'center' }}
              onClick={toggleDropdown} // Toggle dropdown khi click
            >
              {/* Hiển thị lá cờ của ngôn ngữ đã chọn */}
              {selectedLanguage === 'VietNam' ? (
                <img
                  src="https://upload.wikimedia.org/wikipedia/commons/2/21/Flag_of_Vietnam.svg"
                  alt="Vietnam Flag"
                  style={{ width: '32px', height: '24px', borderRadius: '3px', boxShadow: '0px 4px 6px rgba(0, 0, 0, 0.1)' }}
                />
              ) : (
                <img
                  src="https://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/Flag_of_the_United_States_%28DoS_ECA_Color_Standard%29.svg/640px-Flag_of_the_United_States_%28DoS_ECA_Color_Standard%29.svg.png"
                  alt="USA Flag"
                  style={{ width: '32px', height: '24px', borderRadius: '3px', boxShadow: '0px 4px 6px rgba(0, 0, 0, 0.1)' }}
                />
              )}
            </div>

            {/* Dropdown list of languages */}
            {isDropdownVisible && ( // Hiển thị dropdown dựa trên trạng thái
              <div style={{ position: 'absolute', top: '30px', left: '0', backgroundColor: '#fff', boxShadow: '0px 4px 10px rgba(0, 0, 0, 0.1)', borderRadius: '5px', zIndex: 1 }}>
                <div
                  onClick={() => handleLanguageChange('VietNam')}
                  style={{ padding: '5px', cursor: 'pointer', display: 'flex', alignItems: 'center' }}
                >
                  <img
                    src="https://upload.wikimedia.org/wikipedia/commons/2/21/Flag_of_Vietnam.svg"
                    alt="Vietnam Flag"
                    style={{ width: '32px', height: '24px', borderRadius: '3px', marginRight: '10px' }}
                  />
                  <span>Việt Nam</span> {/* Thêm label cho dễ nhận biết */}
                </div>
                <div
                  onClick={() => handleLanguageChange('USA')}
                  style={{ padding: '5px', cursor: 'pointer', display: 'flex', alignItems: 'center' }}
                >
                  <img
                    src="https://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/Flag_of_the_United_States_%28DoS_ECA_Color_Standard%29.svg/640px-Flag_of_the_United_States_%28DoS_ECA_Color_Standard%29.svg.png"
                    alt="USA Flag"
                    style={{ width: '32px', height: '24px', borderRadius: '3px', marginRight: '10px' }}
                  />
                  <span>USA</span> {/* Thêm label cho dễ nhận biết */}
                </div>
              </div>
            )}
          </div>
        </Col>
      </WrapperHeader>
    </div>
  );
};

export default HeaderComponent;
