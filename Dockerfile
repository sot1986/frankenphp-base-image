# Accepted values: 8.3 - 8.2
ARG PHP_VERSION=8.3

ARG FRANKENPHP_VERSION=latest

ARG COMPOSER_VERSION=latest

ARG NODE_VERSION=20-alpine

FROM node:${NODE_VERSION} AS build

FROM composer:${COMPOSER_VERSION} AS vendor

FROM dunglas/frankenphp:${FRANKENPHP_VERSION}-php${PHP_VERSION}-alpine AS php
