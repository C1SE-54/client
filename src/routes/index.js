import HomePage from "../pages/HomePage/HomePage";
import NotFoundPage from "../pages/NotFoundPage/NotFoundPage";
import OrderPage from "../pages/OrderPage/OrderPage";
import ProductDetailPage from "../pages/ProductDetailPage/ProductDetailPage";
import ProductsPage from "../pages/ProductsPage/ProductsPage";
import SignInPage from "../pages/SignInPage/SignInPage";
import SignUpPage from "../pages/SignUpPage/SignUpPage";
import TypeProductPage from "../pages/TypeProductPage/TypeProductPage";
import ForgotPassword from "../pages/ForgotPassword/ForgotPassword";
import ResetPassword from "../pages/ForgotPassword/ResetPassword";
import ForumPage from "../pages/ForumPage/ForumPage";
import SearchPests from "../pages/SearchPests/SearchPests";
import Login from "../pages/admin/auth/Login";

export const routes = [
  {
    path: '/SearchPests',
    page: SearchPests,
    isShowHeader: false
  },
  {
    path: '/Login',
    page: Login,
    isShowHeader: false
  },
  {
    path: '/ForumPage',
    page: ForumPage,
    isShowHeader: true

  },
  {
    path: '/',
    page: HomePage,
    isShowHeader: true
  },
  {
    path: '/order',
    page: OrderPage,
    isShowHeader: true

  },
  {
    path: '/products',
    page: ProductsPage,
    isShowHeader: true
  },
  {
    path: '/type',
    page: TypeProductPage,
    isShowHeader: true
  },
  {
    path: '/sign-in',
    page: SignInPage,
    isShowHeader: false
  },
  {
    path: '/forgotpassword',
    page: ForgotPassword,
    isShowHeader: false
  },
  {
    path: '/resetpassword',
    page: ResetPassword,
    isShowHeader: false
  },
  {
    path: '/sign-up',
    page: SignUpPage,
    isShowHeader: false
  },
  {
    path: '/product-details',
    page: ProductDetailPage,
    isShowHeader: true
  },
  {
    path: '*',
    page: NotFoundPage
  }

]