FROM node:18-alpine

WORKDIR /app

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