/*     */ package com.qingtao.util;
/*     */ 
/*     */ import java.text.SimpleDateFormat;
/*     */ import java.util.Date;
/*     */ import java.util.Properties;

/*     */ import javax.mail.Message;
/*     */ import javax.mail.Session;
/*     */ import javax.mail.Transport;
/*     */ import javax.mail.internet.InternetAddress;
/*     */ import javax.mail.internet.MimeMessage;
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ public class Mail
/*     */ {
/*     */   private String subject;
/*     */   private String content;
/*     */   private String toAddress;
/*     */   
/*     */   public void setToAddress(String toAddress)
/*     */   {
/*  29 */     this.toAddress = toAddress;
/*     */   }
/*     */   
/*     */   public void setSubject(String subject) {
/*  33 */     this.subject = subject;
/*     */   }
/*     */   
/*     */   public void setContent(String content) {
/*  37 */     this.content = content;
/*     */   }
/*     */   
/*     */ 
/*     */   public Mail() {}
/*     */   
/*     */ 
/*     */   public Mail(String subject, String content, String toAddress)
/*     */   {
/*  46 */     this.subject = subject;
/*  47 */     this.content = content;
/*  48 */     this.toAddress = toAddress;
/*     */   }
/*     */   
/*     */   public void sendMail() throws Exception {
/*  52 */     Properties pro = new Properties();
/*     */     
/*  54 */     pro.setProperty("mail.smtp", "smtp.sina.com.cn");
/*     */     
/*  56 */     pro.setProperty("mail.transport.protocol", "smtp");
/*     */     
/*  58 */     pro.setProperty("mail.smtp.auth", "true");
/*     */     
/*  60 */     Session session = Session.getInstance(pro);
/*  61 */     session.setDebug(true);
/*     */     
/*  63 */     Transport transport = session.getTransport();
/*     */     
/*  65 */     transport.connect("smtp.qq.com", "tiantang201@qq.com", "daxieA0201");
/*     */     
/*  67 */     Message message = createMail(session);
/*     */     
/*  69 */     transport.sendMessage(message, message.getAllRecipients());
/*  70 */     transport.close();
/*     */   }
/*     */   
/*     */   private MimeMessage createMail(Session session) throws Exception
/*     */   {
/*  75 */     MimeMessage mime = new MimeMessage(session);
/*     */     
/*  77 */     mime.setFrom(new InternetAddress("tiantang201@qq.com"));
/*     */     
/*  79 */     mime.setRecipient(Message.RecipientType.TO, new InternetAddress(this.toAddress));
/*     */     
/*  81 */     mime.setSubject(this.subject);
/*     */     
/*  83 */     mime.setContent(this.content, "text/html;charset=UTF-8");
/*  84 */     return mime;
/*     */   }
/*     */   
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */   public Integer sendCode(String address)
/*     */     throws Exception
/*     */   {
/*  94 */     int random = (int)(Math.random() * 1000000.0D);
/*  95 */     StringBuffer sb = new StringBuffer();
/*  96 */     sb.append("<strong>亲爱的用户:</strong><br>");
/*  97 */     sb.append("您好！您正在进行邮箱验证，找回密码，本次请求的验证码为：<br>");
/*  98 */     sb.append("<span style='color:#FF9900'>" + random + "</span>");
/*  99 */     sb.append("<span style='color:#979797'>(为了保障您帐号的安全性，请在30分钟内完成验证。)</span>");
/*     */     
/* 103 */     sb.append(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
/*     */     
/* 105 */     setSubject("邮箱身份验证");
/* 106 */     setContent(sb.toString());
/* 107 */     setToAddress(address);
/* 108 */     sendMail();
/* 109 */     return Integer.valueOf(random);
/*     */   }
/*     */ }