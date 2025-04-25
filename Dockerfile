FROM node:18-alpine

WORKDIR /app

# کپی کردن فایل‌های محیطی
COPY .env .env

# تنظیم متغیرهای محیطی ضروری به صورت مستقیم
ENV AUTH_JWT_ACCESS_TOKEN_SECRET_KEY=5dK8aN2pT7bV1zX4qR9sJ3wF6hL0mY7
ENV AUTH_JWT_REFRESH_TOKEN_SECRET_KEY=9nB7vC5xZ3kL1mP0qS4dF6gH8jR2wT5
ENV AUTH_JWT_FORGOT_PASSWORD_TOKEN_SECRET_KEY=3tY6uI1oP9aS8dF7gH4jK2lZ5xC3vB0
ENV AUTH_JWT_VERIFY_EMAIL_TOKEN_SECRET_KEY=7mN4bV2cX9zL8kJ6hG3fD5sA1pO0iU8

# تنظیم متغیرهای محیطی MongoDB
ENV DATABASE_URL=mongodb://mongo:oQrhrYcsBbVGRENRLgAVSKFATLVfOgZA@caboose.proxy.rlwy.net:24477
ENV DATABASE_NAME=mydb

# کپی کردن فایل‌های مورد نیاز
COPY monolithic/package*.json ./
COPY monolithic/ ./

# نصب وابستگی‌ها
RUN npm install

# بیلد کردن پروژه
RUN npm run build

# حذف وابستگی‌های توسعه و نصب فقط وابستگی‌های تولید
RUN npm prune --production

# پورت مورد استفاده
EXPOSE 3000

# اجرای برنامه
CMD ["npm", "run", "start:prod"]