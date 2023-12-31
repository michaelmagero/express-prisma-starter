-- CreateEnum
CREATE TYPE "RoleEnumType" AS ENUM ('user', 'admin', 'service_provider', 'property_owner');

-- CreateTable
CREATE TABLE "users" (
    "id" TEXT NOT NULL,
    "firstname" VARCHAR(255) NOT NULL,
    "lastname" VARCHAR(255) NOT NULL,
    "email" TEXT NOT NULL,
    "status" BOOLEAN DEFAULT false,
    "password" TEXT NOT NULL,
    "role" "RoleEnumType" DEFAULT 'user',
    "verificationCode" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "users_email_verificationCode_idx" ON "users"("email", "verificationCode");

-- CreateIndex
CREATE UNIQUE INDEX "users_email_verificationCode_key" ON "users"("email", "verificationCode");
