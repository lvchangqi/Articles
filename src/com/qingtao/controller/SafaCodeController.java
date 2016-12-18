/*    */ package com.qingtao.controller;
/*    */ 
/*    */ import java.awt.Color;
/*    */ import java.awt.Font;
/*    */ import java.awt.Graphics;
/*    */ import java.awt.image.BufferedImage;
/*    */ import java.io.OutputStream;
/*    */ import java.io.PrintWriter;
/*    */ import java.util.Random;
/*    */ import javax.imageio.ImageIO;
/*    */ import javax.servlet.http.HttpServletRequest;
/*    */ import javax.servlet.http.HttpServletResponse;
/*    */ import org.springframework.stereotype.Controller;
/*    */ import org.springframework.web.bind.annotation.RequestMapping;
/*    */ 
/*    */ 
/*    */ 
/*    */ 
/*    */ 
/*    */ 
/*    */ 
/*    */ 
/*    */ 
/*    */ 
/*    */ 
/*    */ @Controller
/*    */ @RequestMapping({"/safecode"})
/*    */ public class SafaCodeController
/*    */ {
/*    */   @RequestMapping(value={"/create_sc"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
/*    */   public void validSafeCode(HttpServletRequest request, HttpServletResponse response)
/*    */     throws Exception
/*    */   {
/* 35 */     response.setContentType("image/jpeg");
/*    */     
/* 37 */     response.setHeader("Pragma", "No-cache");
/* 38 */     response.setHeader("Cache-Control", "No-cache");
/* 39 */     response.setDateHeader("Expires", 0L);
/*    */     
/* 41 */     OutputStream os = response.getOutputStream();
/* 42 */     int width = 80;int height = 20;
/*    */     
/* 44 */     BufferedImage image = new BufferedImage(width, height, 1);
/*    */     
/* 46 */     Graphics g = image.getGraphics();
/* 47 */     Color c = g.getColor();
/* 48 */     g.fillRect(0, 0, width, height);
/*    */     
/* 50 */     g.setFont(new Font("Times New Roman", 0, 18));
/*    */     
/* 52 */     char[] ch = "abcdefghjkmnpqrstuvwxyz23456789".toCharArray();
/* 53 */     int length = ch.length;
/* 54 */     String sRand = "";
/* 55 */     Random random = new Random();
/* 56 */     for (int i = 0; i < 4; i++) {
/* 57 */       String rand = new Character(ch[random.nextInt(length)]).toString();
/* 58 */       sRand = sRand + rand;
/*    */       
/* 60 */       g.setColor(new Color(20 + random.nextInt(110), 20 + random.nextInt(110), 20 + random.nextInt(110)));
/*    */       
/* 62 */       g.drawString(rand, 13 * i + 6, 16);
/*    */     }
/* 64 */     g.setColor(c);
/* 65 */     g.dispose();
/*    */     
/*    */ 
/* 68 */     request.getSession().setAttribute("safecode", sRand);
/*    */     
/* 70 */     ImageIO.write(image, "JPEG", os);
/*    */   }
/*    */   
/*    */ 
/*    */ 
/*    */ 
/*    */ 
/*    */ 
/*    */   @RequestMapping(value={"/check_sc"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
/*    */   public void safeCodeCheck(HttpServletRequest request, HttpServletResponse response)
/*    */   {
/* 81 */     response.setContentType("text/html;charset=utf-8");
/*    */     
/* 83 */     String safecode = request.getParameter("safecode").toLowerCase();
/*    */     try {
/* 85 */       PrintWriter out = response.getWriter();
/* 86 */       boolean isValid = false;
/* 87 */       if (request.getSession().getAttribute("safecode").equals(safecode)) {
/* 88 */         isValid = true;
/*    */       }
/* 90 */       out.print(isValid);
/* 91 */       out.flush();
/* 92 */       out.close();
/*    */     } catch (Exception ex) {
/* 94 */       ex.printStackTrace();
/*    */     }
/*    */   }
/*    */ }
