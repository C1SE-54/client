import React from 'react';
import { Menu } from 'antd';
import { HomeOutlined } from '@ant-design/icons';
import { Link } from 'react-router-dom';
import { WrapperMenu, WrapperMenuItems } from './style'; 
// import { useNavigate } from 'react-router-dom';

const NavbarComponent = () => {
  // const navigate = useNavigate();

  // const handleNavigateSearchPests = () => {
  //   navigate('/SearchPests');
  // };

  return (
    <WrapperMenu>
      <WrapperMenuItems>
        <Menu mode="horizontal" theme="dark" defaultSelectedKeys={[]} style={{ backgroundColor: '#A50034', border: 'none', flexGrow: 1 }}>
          <Menu.Item key="" icon={<HomeOutlined />} style={{ color: 'white' }}>
            <Link to="/" style={{ color: 'white' }}>Home</Link>
          </Menu.Item>
          <Menu.Item key="forum" style={{ color: 'white' }}>
            <Link to="/SearchPests" style={{ color: 'white' }}>Sâu bệnh</Link>
          </Menu.Item>
          <Menu.Item key="news" style={{ color: 'white' }}>
            <Link to="/news" style={{ color: 'white' }}>Có gì mới</Link>
          </Menu.Item>
          <Menu.Item key="farming" style={{ color: 'white' }}>
            <Link to="/farming" style={{ color: 'white' }}>Chăn nuôi</Link>
          </Menu.Item>
          <Menu.Item key="planting" style={{ color: 'white' }}>
            <Link to="/planting" style={{ color: 'white' }}>Trồng trọt</Link>
          </Menu.Item>
          <Menu.Item key="aquaculture" style={{ color: 'white' }}>
            <Link to="/aquaculture" style={{ color: 'white' }}>Thủy sản</Link>
          </Menu.Item>
          <Menu.Item key="pet" style={{ color: 'white' }}>
            <Link to="/pet" style={{ color: 'white' }}>Sinh vật cảnh</Link>
          </Menu.Item>
          <Menu.SubMenu key="market" title="Mua & bán" style={{ color: 'white' }}>
            <Menu.Item key="buy">
              <Link to="/buy">Mua</Link>
            </Menu.Item>
            <Menu.Item key="sell">
              <Link to="/sell">Bán</Link>
            </Menu.Item>
          </Menu.SubMenu>
        </Menu>
      </WrapperMenuItems>
    </WrapperMenu>
  );
};

export default NavbarComponent;
