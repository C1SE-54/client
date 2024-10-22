import React, { useState, useEffect } from 'react'
import TypeProduct from '../../components/TypeProduct/TypeProduct'
import { WrapperButtonMore, WrapperProducts, WrapperTypeProduct, StickyNavbarWrapper } from './style'
import SliderComponent from '../../components/SliderComponent/SliderComponent'
import slider1 from '../../assets/images/slider1.jpg'
import slider2 from '../../assets/images/slider2.png'
import slider3 from '../../assets/images/slider3.png'
import NavbarComponent from '../../components/NavbarComponent/NavbarComponent'
import CardComponent from '../../components/CardComponent/CardComponent'
import FooterComponent from '../../components/FooterComponent/FooterComponent'

const HomePage = () => {
  const [isSticky, setIsSticky] = useState(false); // Trạng thái để theo dõi khi cuộn qua navbar
  const arr = ['Cây trồng', 'Phân bón', 'Thiết bị nông nghiệp']

  // Hàm để kiểm tra trạng thái cuộn
  const handleScroll = () => {
    const offset = window.scrollY; // Lấy vị trí cuộn hiện tại
    if (offset > 100) { // Khi cuộn qua 100px
      setIsSticky(true); // Cố định navbar
    } else {
      setIsSticky(false); // Trở lại trạng thái bình thường
    }
  };

  useEffect(() => {
    window.addEventListener('scroll', handleScroll);
    return () => window.removeEventListener('scroll', handleScroll);
  }, []);

  return (
    <>
      {/* Sử dụng styled-components để thêm thuộc tính sticky */}
      <StickyNavbarWrapper isSticky={isSticky}>
        <NavbarComponent />
      </StickyNavbarWrapper>

      {/* Nội dung chính */}
      <div id="container" style={{ backgroundColor: '#efefef', padding: '0 120px', paddingTop: isSticky ? '60px' : '0px', height: '1000px' }}>
        <SliderComponent arrImages={[slider1, slider2, slider3]} />
        <WrapperProducts>
          <CardComponent />
          <CardComponent />
          <CardComponent />
          <CardComponent />
          <CardComponent />
          <CardComponent />
          <CardComponent />
          <CardComponent />
        </WrapperProducts>
        <div style={{ width: '100%', marginTop: '10px', display: 'flex', justifyContent: 'center' }}>
          <WrapperButtonMore textButton='Xem thêm' type='outline'
            styleButton={{
              border: '1px solid rgb(11, 116, 229)',
              color: 'rgb(11,116,229)',
              width: '240px', height: '38px', borderRadius: '4px'
            }}
            styleTextButton={{ fontWeight: 500 }}
          />
        </div>
      </div>
      <FooterComponent />


    </>
  )
}

export default HomePage
