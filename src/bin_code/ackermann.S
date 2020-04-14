
bin_code/ackermann:     file format elf64-littleriscv


Disassembly of section .text:

00000000000100b0 <register_fini>:
   100b0:	000007b7          	lui	a5,0x0
   100b4:	00078793          	mv	a5,a5
   100b8:	c789                	beqz	a5,100c2 <register_fini+0x12>
   100ba:	6541                	lui	a0,0x10
   100bc:	4e050513          	addi	a0,a0,1248 # 104e0 <__libc_fini_array>
   100c0:	a991                	j	10514 <atexit>
   100c2:	8082                	ret

00000000000100c4 <_start>:
   100c4:	00002197          	auipc	gp,0x2
   100c8:	d2418193          	addi	gp,gp,-732 # 11de8 <__global_pointer$>
   100cc:	f6018513          	addi	a0,gp,-160 # 11d48 <_edata>
   100d0:	f9818613          	addi	a2,gp,-104 # 11d80 <__BSS_END__>
   100d4:	8e09                	sub	a2,a2,a0
   100d6:	4581                	li	a1,0
   100d8:	29c000ef          	jal	ra,10374 <memset>
   100dc:	00000517          	auipc	a0,0x0
   100e0:	43850513          	addi	a0,a0,1080 # 10514 <atexit>
   100e4:	c519                	beqz	a0,100f2 <_start+0x2e>
   100e6:	00000517          	auipc	a0,0x0
   100ea:	3fa50513          	addi	a0,a0,1018 # 104e0 <__libc_fini_array>
   100ee:	426000ef          	jal	ra,10514 <atexit>
   100f2:	218000ef          	jal	ra,1030a <__libc_init_array>
   100f6:	4502                	lw	a0,0(sp)
   100f8:	002c                	addi	a1,sp,8
   100fa:	4601                	li	a2,0
   100fc:	148000ef          	jal	ra,10244 <main>
   10100:	a2f5                	j	102ec <exit>

0000000000010102 <__do_global_dtors_aux>:
   10102:	f601c703          	lbu	a4,-160(gp) # 11d48 <_edata>
   10106:	eb05                	bnez	a4,10136 <__do_global_dtors_aux+0x34>
   10108:	1141                	addi	sp,sp,-16
   1010a:	e022                	sd	s0,0(sp)
   1010c:	843e                	mv	s0,a5
   1010e:	000007b7          	lui	a5,0x0
   10112:	e406                	sd	ra,8(sp)
   10114:	00078793          	mv	a5,a5
   10118:	cb81                	beqz	a5,10128 <__do_global_dtors_aux+0x26>
   1011a:	6545                	lui	a0,0x11
   1011c:	5c850513          	addi	a0,a0,1480 # 115c8 <__FRAME_END__>
   10120:	00000097          	auipc	ra,0x0
   10124:	000000e7          	jalr	zero # 0 <register_fini-0x100b0>
   10128:	4785                	li	a5,1
   1012a:	60a2                	ld	ra,8(sp)
   1012c:	f6f18023          	sb	a5,-160(gp) # 11d48 <_edata>
   10130:	6402                	ld	s0,0(sp)
   10132:	0141                	addi	sp,sp,16
   10134:	8082                	ret
   10136:	8082                	ret

0000000000010138 <frame_dummy>:
   10138:	000007b7          	lui	a5,0x0
   1013c:	00078793          	mv	a5,a5
   10140:	cb91                	beqz	a5,10154 <frame_dummy+0x1c>
   10142:	6545                	lui	a0,0x11
   10144:	f6818593          	addi	a1,gp,-152 # 11d50 <object.5532>
   10148:	5c850513          	addi	a0,a0,1480 # 115c8 <__FRAME_END__>
   1014c:	00000317          	auipc	t1,0x0
   10150:	00000067          	jr	zero # 0 <register_fini-0x100b0>
   10154:	8082                	ret
	...

0000000000010158 <ackermann>:
   10158:	fd010113          	addi	sp,sp,-48
   1015c:	02113423          	sd	ra,40(sp)
   10160:	02813023          	sd	s0,32(sp)
   10164:	00913c23          	sd	s1,24(sp)
   10168:	03010413          	addi	s0,sp,48
   1016c:	00050793          	mv	a5,a0
   10170:	00058713          	mv	a4,a1
   10174:	fcf42e23          	sw	a5,-36(s0)
   10178:	00070793          	mv	a5,a4
   1017c:	fcf42c23          	sw	a5,-40(s0)
   10180:	fdc42783          	lw	a5,-36(s0)
   10184:	0007879b          	sext.w	a5,a5
   10188:	00079a63          	bnez	a5,1019c <ackermann+0x44>
   1018c:	fd842783          	lw	a5,-40(s0)
   10190:	0017879b          	addiw	a5,a5,1
   10194:	0007879b          	sext.w	a5,a5
   10198:	0940006f          	j	1022c <ackermann+0xd4>
   1019c:	fdc42783          	lw	a5,-36(s0)
   101a0:	0007879b          	sext.w	a5,a5
   101a4:	02f05863          	blez	a5,101d4 <ackermann+0x7c>
   101a8:	fd842783          	lw	a5,-40(s0)
   101ac:	0007879b          	sext.w	a5,a5
   101b0:	02079263          	bnez	a5,101d4 <ackermann+0x7c>
   101b4:	fdc42783          	lw	a5,-36(s0)
   101b8:	fff7879b          	addiw	a5,a5,-1
   101bc:	0007879b          	sext.w	a5,a5
   101c0:	00100593          	li	a1,1
   101c4:	00078513          	mv	a0,a5
   101c8:	f91ff0ef          	jal	ra,10158 <ackermann>
   101cc:	00050793          	mv	a5,a0
   101d0:	05c0006f          	j	1022c <ackermann+0xd4>
   101d4:	fdc42783          	lw	a5,-36(s0)
   101d8:	0007879b          	sext.w	a5,a5
   101dc:	04f05863          	blez	a5,1022c <ackermann+0xd4>
   101e0:	fd842783          	lw	a5,-40(s0)
   101e4:	0007879b          	sext.w	a5,a5
   101e8:	04f05263          	blez	a5,1022c <ackermann+0xd4>
   101ec:	fdc42783          	lw	a5,-36(s0)
   101f0:	fff7879b          	addiw	a5,a5,-1
   101f4:	0007849b          	sext.w	s1,a5
   101f8:	fd842783          	lw	a5,-40(s0)
   101fc:	fff7879b          	addiw	a5,a5,-1
   10200:	0007871b          	sext.w	a4,a5
   10204:	fdc42783          	lw	a5,-36(s0)
   10208:	00070593          	mv	a1,a4
   1020c:	00078513          	mv	a0,a5
   10210:	f49ff0ef          	jal	ra,10158 <ackermann>
   10214:	00050793          	mv	a5,a0
   10218:	00078593          	mv	a1,a5
   1021c:	00048513          	mv	a0,s1
   10220:	f39ff0ef          	jal	ra,10158 <ackermann>
   10224:	00050793          	mv	a5,a0
   10228:	0040006f          	j	1022c <ackermann+0xd4>
   1022c:	00078513          	mv	a0,a5
   10230:	02813083          	ld	ra,40(sp)
   10234:	02013403          	ld	s0,32(sp)
   10238:	01813483          	ld	s1,24(sp)
   1023c:	03010113          	addi	sp,sp,48
   10240:	00008067          	ret

0000000000010244 <main>:
   10244:	fe010113          	addi	sp,sp,-32
   10248:	00113c23          	sd	ra,24(sp)
   1024c:	00813823          	sd	s0,16(sp)
   10250:	02010413          	addi	s0,sp,32
   10254:	00600593          	li	a1,6
   10258:	00300513          	li	a0,3
   1025c:	efdff0ef          	jal	ra,10158 <ackermann>
   10260:	00050793          	mv	a5,a0
   10264:	fef42623          	sw	a5,-20(s0)
   10268:	fec42783          	lw	a5,-20(s0)
   1026c:	00078513          	mv	a0,a5
   10270:	024000ef          	jal	ra,10294 <PrintInt>
   10274:	00a00513          	li	a0,10
   10278:	048000ef          	jal	ra,102c0 <PrintChar>
   1027c:	00000793          	li	a5,0
   10280:	00078513          	mv	a0,a5
   10284:	01813083          	ld	ra,24(sp)
   10288:	01013403          	ld	s0,16(sp)
   1028c:	02010113          	addi	sp,sp,32
   10290:	00008067          	ret

0000000000010294 <PrintInt>:
   10294:	fe010113          	addi	sp,sp,-32
   10298:	00813c23          	sd	s0,24(sp)
   1029c:	02010413          	addi	s0,sp,32
   102a0:	00050793          	mv	a5,a0
   102a4:	fef42623          	sw	a5,-20(s0)
   102a8:	00000893          	li	a7,0
   102ac:	00000073          	ecall
   102b0:	00000013          	nop
   102b4:	01813403          	ld	s0,24(sp)
   102b8:	02010113          	addi	sp,sp,32
   102bc:	00008067          	ret

00000000000102c0 <PrintChar>:
   102c0:	fe010113          	addi	sp,sp,-32
   102c4:	00813c23          	sd	s0,24(sp)
   102c8:	02010413          	addi	s0,sp,32
   102cc:	00050793          	mv	a5,a0
   102d0:	fef407a3          	sb	a5,-17(s0)
   102d4:	00100893          	li	a7,1
   102d8:	00000073          	ecall
   102dc:	00000013          	nop
   102e0:	01813403          	ld	s0,24(sp)
   102e4:	02010113          	addi	sp,sp,32
   102e8:	00008067          	ret

00000000000102ec <exit>:
   102ec:	1141                	addi	sp,sp,-16
   102ee:	4581                	li	a1,0
   102f0:	e022                	sd	s0,0(sp)
   102f2:	e406                	sd	ra,8(sp)
   102f4:	842a                	mv	s0,a0
   102f6:	128000ef          	jal	ra,1041e <__call_exitprocs>
   102fa:	f481b503          	ld	a0,-184(gp) # 11d30 <_global_impure_ptr>
   102fe:	6d3c                	ld	a5,88(a0)
   10300:	c391                	beqz	a5,10304 <exit+0x18>
   10302:	9782                	jalr	a5
   10304:	8522                	mv	a0,s0
   10306:	28e000ef          	jal	ra,10594 <_exit>

000000000001030a <__libc_init_array>:
   1030a:	1101                	addi	sp,sp,-32
   1030c:	e822                	sd	s0,16(sp)
   1030e:	e04a                	sd	s2,0(sp)
   10310:	6445                	lui	s0,0x11
   10312:	6945                	lui	s2,0x11
   10314:	5cc40793          	addi	a5,s0,1484 # 115cc <__preinit_array_end>
   10318:	5cc90913          	addi	s2,s2,1484 # 115cc <__preinit_array_end>
   1031c:	40f90933          	sub	s2,s2,a5
   10320:	ec06                	sd	ra,24(sp)
   10322:	e426                	sd	s1,8(sp)
   10324:	40395913          	srai	s2,s2,0x3
   10328:	00090b63          	beqz	s2,1033e <__libc_init_array+0x34>
   1032c:	5cc40413          	addi	s0,s0,1484
   10330:	4481                	li	s1,0
   10332:	601c                	ld	a5,0(s0)
   10334:	0485                	addi	s1,s1,1
   10336:	0421                	addi	s0,s0,8
   10338:	9782                	jalr	a5
   1033a:	fe991ce3          	bne	s2,s1,10332 <__libc_init_array+0x28>
   1033e:	6445                	lui	s0,0x11
   10340:	6945                	lui	s2,0x11
   10342:	5d040793          	addi	a5,s0,1488 # 115d0 <__init_array_start>
   10346:	5e090913          	addi	s2,s2,1504 # 115e0 <__init_array_end>
   1034a:	40f90933          	sub	s2,s2,a5
   1034e:	40395913          	srai	s2,s2,0x3
   10352:	00090b63          	beqz	s2,10368 <__libc_init_array+0x5e>
   10356:	5d040413          	addi	s0,s0,1488
   1035a:	4481                	li	s1,0
   1035c:	601c                	ld	a5,0(s0)
   1035e:	0485                	addi	s1,s1,1
   10360:	0421                	addi	s0,s0,8
   10362:	9782                	jalr	a5
   10364:	fe991ce3          	bne	s2,s1,1035c <__libc_init_array+0x52>
   10368:	60e2                	ld	ra,24(sp)
   1036a:	6442                	ld	s0,16(sp)
   1036c:	64a2                	ld	s1,8(sp)
   1036e:	6902                	ld	s2,0(sp)
   10370:	6105                	addi	sp,sp,32
   10372:	8082                	ret

0000000000010374 <memset>:
   10374:	433d                	li	t1,15
   10376:	872a                	mv	a4,a0
   10378:	02c37163          	bgeu	t1,a2,1039a <memset+0x26>
   1037c:	00f77793          	andi	a5,a4,15
   10380:	e3c1                	bnez	a5,10400 <memset+0x8c>
   10382:	e1bd                	bnez	a1,103e8 <memset+0x74>
   10384:	ff067693          	andi	a3,a2,-16
   10388:	8a3d                	andi	a2,a2,15
   1038a:	96ba                	add	a3,a3,a4
   1038c:	e30c                	sd	a1,0(a4)
   1038e:	e70c                	sd	a1,8(a4)
   10390:	0741                	addi	a4,a4,16
   10392:	fed76de3          	bltu	a4,a3,1038c <memset+0x18>
   10396:	e211                	bnez	a2,1039a <memset+0x26>
   10398:	8082                	ret
   1039a:	40c306b3          	sub	a3,t1,a2
   1039e:	068a                	slli	a3,a3,0x2
   103a0:	00000297          	auipc	t0,0x0
   103a4:	9696                	add	a3,a3,t0
   103a6:	00a68067          	jr	10(a3)
   103aa:	00b70723          	sb	a1,14(a4)
   103ae:	00b706a3          	sb	a1,13(a4)
   103b2:	00b70623          	sb	a1,12(a4)
   103b6:	00b705a3          	sb	a1,11(a4)
   103ba:	00b70523          	sb	a1,10(a4)
   103be:	00b704a3          	sb	a1,9(a4)
   103c2:	00b70423          	sb	a1,8(a4)
   103c6:	00b703a3          	sb	a1,7(a4)
   103ca:	00b70323          	sb	a1,6(a4)
   103ce:	00b702a3          	sb	a1,5(a4)
   103d2:	00b70223          	sb	a1,4(a4)
   103d6:	00b701a3          	sb	a1,3(a4)
   103da:	00b70123          	sb	a1,2(a4)
   103de:	00b700a3          	sb	a1,1(a4)
   103e2:	00b70023          	sb	a1,0(a4)
   103e6:	8082                	ret
   103e8:	0ff5f593          	andi	a1,a1,255
   103ec:	00859693          	slli	a3,a1,0x8
   103f0:	8dd5                	or	a1,a1,a3
   103f2:	01059693          	slli	a3,a1,0x10
   103f6:	8dd5                	or	a1,a1,a3
   103f8:	02059693          	slli	a3,a1,0x20
   103fc:	8dd5                	or	a1,a1,a3
   103fe:	b759                	j	10384 <memset+0x10>
   10400:	00279693          	slli	a3,a5,0x2
   10404:	00000297          	auipc	t0,0x0
   10408:	9696                	add	a3,a3,t0
   1040a:	8286                	mv	t0,ra
   1040c:	fa2680e7          	jalr	-94(a3)
   10410:	8096                	mv	ra,t0
   10412:	17c1                	addi	a5,a5,-16
   10414:	8f1d                	sub	a4,a4,a5
   10416:	963e                	add	a2,a2,a5
   10418:	f8c371e3          	bgeu	t1,a2,1039a <memset+0x26>
   1041c:	b79d                	j	10382 <memset+0xe>

000000000001041e <__call_exitprocs>:
   1041e:	715d                	addi	sp,sp,-80
   10420:	f052                	sd	s4,32(sp)
   10422:	f481ba03          	ld	s4,-184(gp) # 11d30 <_global_impure_ptr>
   10426:	f84a                	sd	s2,48(sp)
   10428:	e486                	sd	ra,72(sp)
   1042a:	1f8a3903          	ld	s2,504(s4)
   1042e:	e0a2                	sd	s0,64(sp)
   10430:	fc26                	sd	s1,56(sp)
   10432:	f44e                	sd	s3,40(sp)
   10434:	ec56                	sd	s5,24(sp)
   10436:	e85a                	sd	s6,16(sp)
   10438:	e45e                	sd	s7,8(sp)
   1043a:	e062                	sd	s8,0(sp)
   1043c:	02090863          	beqz	s2,1046c <__call_exitprocs+0x4e>
   10440:	8b2a                	mv	s6,a0
   10442:	8bae                	mv	s7,a1
   10444:	4a85                	li	s5,1
   10446:	59fd                	li	s3,-1
   10448:	00892483          	lw	s1,8(s2)
   1044c:	fff4841b          	addiw	s0,s1,-1
   10450:	00044e63          	bltz	s0,1046c <__call_exitprocs+0x4e>
   10454:	048e                	slli	s1,s1,0x3
   10456:	94ca                	add	s1,s1,s2
   10458:	020b8663          	beqz	s7,10484 <__call_exitprocs+0x66>
   1045c:	2084b783          	ld	a5,520(s1)
   10460:	03778263          	beq	a5,s7,10484 <__call_exitprocs+0x66>
   10464:	347d                	addiw	s0,s0,-1
   10466:	14e1                	addi	s1,s1,-8
   10468:	ff3418e3          	bne	s0,s3,10458 <__call_exitprocs+0x3a>
   1046c:	60a6                	ld	ra,72(sp)
   1046e:	6406                	ld	s0,64(sp)
   10470:	74e2                	ld	s1,56(sp)
   10472:	7942                	ld	s2,48(sp)
   10474:	79a2                	ld	s3,40(sp)
   10476:	7a02                	ld	s4,32(sp)
   10478:	6ae2                	ld	s5,24(sp)
   1047a:	6b42                	ld	s6,16(sp)
   1047c:	6ba2                	ld	s7,8(sp)
   1047e:	6c02                	ld	s8,0(sp)
   10480:	6161                	addi	sp,sp,80
   10482:	8082                	ret
   10484:	00892783          	lw	a5,8(s2)
   10488:	6498                	ld	a4,8(s1)
   1048a:	37fd                	addiw	a5,a5,-1
   1048c:	04878463          	beq	a5,s0,104d4 <__call_exitprocs+0xb6>
   10490:	0004b423          	sd	zero,8(s1)
   10494:	db61                	beqz	a4,10464 <__call_exitprocs+0x46>
   10496:	31092783          	lw	a5,784(s2)
   1049a:	008a96bb          	sllw	a3,s5,s0
   1049e:	00892c03          	lw	s8,8(s2)
   104a2:	8ff5                	and	a5,a5,a3
   104a4:	2781                	sext.w	a5,a5
   104a6:	ef89                	bnez	a5,104c0 <__call_exitprocs+0xa2>
   104a8:	9702                	jalr	a4
   104aa:	00892703          	lw	a4,8(s2)
   104ae:	1f8a3783          	ld	a5,504(s4)
   104b2:	01871463          	bne	a4,s8,104ba <__call_exitprocs+0x9c>
   104b6:	faf907e3          	beq	s2,a5,10464 <__call_exitprocs+0x46>
   104ba:	dbcd                	beqz	a5,1046c <__call_exitprocs+0x4e>
   104bc:	893e                	mv	s2,a5
   104be:	b769                	j	10448 <__call_exitprocs+0x2a>
   104c0:	31492783          	lw	a5,788(s2)
   104c4:	1084b583          	ld	a1,264(s1)
   104c8:	8ff5                	and	a5,a5,a3
   104ca:	2781                	sext.w	a5,a5
   104cc:	e799                	bnez	a5,104da <__call_exitprocs+0xbc>
   104ce:	855a                	mv	a0,s6
   104d0:	9702                	jalr	a4
   104d2:	bfe1                	j	104aa <__call_exitprocs+0x8c>
   104d4:	00892423          	sw	s0,8(s2)
   104d8:	bf75                	j	10494 <__call_exitprocs+0x76>
   104da:	852e                	mv	a0,a1
   104dc:	9702                	jalr	a4
   104de:	b7f1                	j	104aa <__call_exitprocs+0x8c>

00000000000104e0 <__libc_fini_array>:
   104e0:	1101                	addi	sp,sp,-32
   104e2:	e822                	sd	s0,16(sp)
   104e4:	67c5                	lui	a5,0x11
   104e6:	6445                	lui	s0,0x11
   104e8:	5e040413          	addi	s0,s0,1504 # 115e0 <__init_array_end>
   104ec:	5e878793          	addi	a5,a5,1512 # 115e8 <__fini_array_end>
   104f0:	8f81                	sub	a5,a5,s0
   104f2:	e426                	sd	s1,8(sp)
   104f4:	ec06                	sd	ra,24(sp)
   104f6:	4037d493          	srai	s1,a5,0x3
   104fa:	c881                	beqz	s1,1050a <__libc_fini_array+0x2a>
   104fc:	17e1                	addi	a5,a5,-8
   104fe:	943e                	add	s0,s0,a5
   10500:	601c                	ld	a5,0(s0)
   10502:	14fd                	addi	s1,s1,-1
   10504:	1461                	addi	s0,s0,-8
   10506:	9782                	jalr	a5
   10508:	fce5                	bnez	s1,10500 <__libc_fini_array+0x20>
   1050a:	60e2                	ld	ra,24(sp)
   1050c:	6442                	ld	s0,16(sp)
   1050e:	64a2                	ld	s1,8(sp)
   10510:	6105                	addi	sp,sp,32
   10512:	8082                	ret

0000000000010514 <atexit>:
   10514:	85aa                	mv	a1,a0
   10516:	4681                	li	a3,0
   10518:	4601                	li	a2,0
   1051a:	4501                	li	a0,0
   1051c:	a009                	j	1051e <__register_exitproc>

000000000001051e <__register_exitproc>:
   1051e:	f481b703          	ld	a4,-184(gp) # 11d30 <_global_impure_ptr>
   10522:	1f873783          	ld	a5,504(a4)
   10526:	c3b1                	beqz	a5,1056a <__register_exitproc+0x4c>
   10528:	4798                	lw	a4,8(a5)
   1052a:	487d                	li	a6,31
   1052c:	06e84263          	blt	a6,a4,10590 <__register_exitproc+0x72>
   10530:	c505                	beqz	a0,10558 <__register_exitproc+0x3a>
   10532:	00371813          	slli	a6,a4,0x3
   10536:	983e                	add	a6,a6,a5
   10538:	10c83823          	sd	a2,272(a6)
   1053c:	3107a883          	lw	a7,784(a5)
   10540:	4605                	li	a2,1
   10542:	00e6163b          	sllw	a2,a2,a4
   10546:	00c8e8b3          	or	a7,a7,a2
   1054a:	3117a823          	sw	a7,784(a5)
   1054e:	20d83823          	sd	a3,528(a6)
   10552:	4689                	li	a3,2
   10554:	02d50063          	beq	a0,a3,10574 <__register_exitproc+0x56>
   10558:	00270693          	addi	a3,a4,2
   1055c:	068e                	slli	a3,a3,0x3
   1055e:	2705                	addiw	a4,a4,1
   10560:	c798                	sw	a4,8(a5)
   10562:	97b6                	add	a5,a5,a3
   10564:	e38c                	sd	a1,0(a5)
   10566:	4501                	li	a0,0
   10568:	8082                	ret
   1056a:	20070793          	addi	a5,a4,512
   1056e:	1ef73c23          	sd	a5,504(a4)
   10572:	bf5d                	j	10528 <__register_exitproc+0xa>
   10574:	3147a683          	lw	a3,788(a5)
   10578:	4501                	li	a0,0
   1057a:	8e55                	or	a2,a2,a3
   1057c:	00270693          	addi	a3,a4,2
   10580:	068e                	slli	a3,a3,0x3
   10582:	2705                	addiw	a4,a4,1
   10584:	30c7aa23          	sw	a2,788(a5)
   10588:	c798                	sw	a4,8(a5)
   1058a:	97b6                	add	a5,a5,a3
   1058c:	e38c                	sd	a1,0(a5)
   1058e:	8082                	ret
   10590:	557d                	li	a0,-1
   10592:	8082                	ret

0000000000010594 <_exit>:
   10594:	4581                	li	a1,0
   10596:	4601                	li	a2,0
   10598:	4681                	li	a3,0
   1059a:	4701                	li	a4,0
   1059c:	4781                	li	a5,0
   1059e:	05d00893          	li	a7,93
   105a2:	00000073          	ecall
   105a6:	00054363          	bltz	a0,105ac <_exit+0x18>
   105aa:	a001                	j	105aa <_exit+0x16>
   105ac:	1141                	addi	sp,sp,-16
   105ae:	e022                	sd	s0,0(sp)
   105b0:	842a                	mv	s0,a0
   105b2:	e406                	sd	ra,8(sp)
   105b4:	4080043b          	negw	s0,s0
   105b8:	008000ef          	jal	ra,105c0 <__errno>
   105bc:	c100                	sw	s0,0(a0)
   105be:	a001                	j	105be <_exit+0x2a>

00000000000105c0 <__errno>:
   105c0:	f581b503          	ld	a0,-168(gp) # 11d40 <_impure_ptr>
   105c4:	8082                	ret
