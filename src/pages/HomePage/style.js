import styled from 'styled-components';
import ButtonComponent from '../../components/ButtonComponent/ButtonComponent';

export const WrapperTypeProduct = styled.div`
  display: flex;
  align-items: center;
  gap: 24px;
  justify-content: flex-start;
  height: 44px;
`

export const WrapperButtonMore = styled(ButtonComponent)`
  &:hover {
    color: #fff;
    background: rgb(13, 92, 182);
    span {
      color: #fff;
    }
  }
  width: 100%;
  align-items: center;
`

export const WrapperProducts = styled.div`
  display: flex;
  justify-content: center;
  gap: 15px;
  margin-top: 20px;
  flex-wrap: wrap;
`

// Navbar cố định khi cuộn qua một điểm
export const StickyNavbarWrapper = styled.div`
  width: 100%;
  z-index: 1000;
  position: ${({ isSticky }) => (isSticky ? 'fixed' : 'relative')};
  top: 0;
  left: 0;
  background-color: ${({ isSticky }) => (isSticky ? 'white' : 'transparent')};
  box-shadow: ${({ isSticky }) => (isSticky ? '0 4px 2px -2px gray' : 'none')};
  transition: all 0.3s ease;
`
