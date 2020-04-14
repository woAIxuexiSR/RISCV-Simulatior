
bin_code/n:     file format elf64-littleriscv


Disassembly of section .text:

00000000000100b0 <register_fini>:
   100b0:	000007b7          	lui	a5,0x0
   100b4:	00078793          	mv	a5,a5
   100b8:	c789                	beqz	a5,100c2 <register_fini+0x12>
   100ba:	6541                	lui	a0,0x10
   100bc:	46050513          	addi	a0,a0,1120 # 10460 <__libc_fini_array>
   100c0:	aed1                	j	10494 <atexit>
   100c2:	8082                	ret

00000000000100c4 <_start>:
   100c4:	00002197          	auipc	gp,0x2
   100c8:	ca418193          	addi	gp,gp,-860 # 11d68 <__global_pointer$>
   100cc:	f6018513          	addi	a0,gp,-160 # 11cc8 <_edata>
   100d0:	fa018613          	addi	a2,gp,-96 # 11d08 <__BSS_END__>
   100d4:	8e09                	sub	a2,a2,a0
   100d6:	4581                	li	a1,0
   100d8:	21c000ef          	jal	ra,102f4 <memset>
   100dc:	00000517          	auipc	a0,0x0
   100e0:	3b850513          	addi	a0,a0,952 # 10494 <atexit>
   100e4:	c519                	beqz	a0,100f2 <_start+0x2e>
   100e6:	00000517          	auipc	a0,0x0
   100ea:	37a50513          	addi	a0,a0,890 # 10460 <__libc_fini_array>
   100ee:	3a6000ef          	jal	ra,10494 <atexit>
   100f2:	198000ef          	jal	ra,1028a <__libc_init_array>
   100f6:	4502                	lw	a0,0(sp)
   100f8:	002c                	addi	a1,sp,8
   100fa:	4601                	li	a2,0
   100fc:	0c8000ef          	jal	ra,101c4 <main>
   10100:	a2b5                	j	1026c <exit>

0000000000010102 <__do_global_dtors_aux>:
   10102:	f681c703          	lbu	a4,-152(gp) # 11cd0 <completed.5527>
   10106:	eb05                	bnez	a4,10136 <__do_global_dtors_aux+0x34>
   10108:	1141                	addi	sp,sp,-16
   1010a:	e022                	sd	s0,0(sp)
   1010c:	843e                	mv	s0,a5
   1010e:	000007b7          	lui	a5,0x0
   10112:	e406                	sd	ra,8(sp)
   10114:	00078793          	mv	a5,a5
   10118:	cb81                	beqz	a5,10128 <__do_global_dtors_aux+0x26>
   1011a:	6545                	lui	a0,0x11
   1011c:	54850513          	addi	a0,a0,1352 # 11548 <__FRAME_END__>
   10120:	00000097          	auipc	ra,0x0
   10124:	000000e7          	jalr	zero # 0 <register_fini-0x100b0>
   10128:	4785                	li	a5,1
   1012a:	60a2                	ld	ra,8(sp)
   1012c:	f6f18423          	sb	a5,-152(gp) # 11cd0 <completed.5527>
   10130:	6402                	ld	s0,0(sp)
   10132:	0141                	addi	sp,sp,16
   10134:	8082                	ret
   10136:	8082                	ret

0000000000010138 <frame_dummy>:
   10138:	000007b7          	lui	a5,0x0
   1013c:	00078793          	mv	a5,a5
   10140:	cb91                	beqz	a5,10154 <frame_dummy+0x1c>
   10142:	6545                	lui	a0,0x11
   10144:	f7018593          	addi	a1,gp,-144 # 11cd8 <object.5532>
   10148:	54850513          	addi	a0,a0,1352 # 11548 <__FRAME_END__>
   1014c:	00000317          	auipc	t1,0x0
   10150:	00000067          	jr	zero # 0 <register_fini-0x100b0>
   10154:	8082                	ret
	...

0000000000010158 <cal_n>:
   10158:	fe010113          	addi	sp,sp,-32
   1015c:	00113c23          	sd	ra,24(sp)
   10160:	00813823          	sd	s0,16(sp)
   10164:	02010413          	addi	s0,sp,32
   10168:	00050793          	mv	a5,a0
   1016c:	fef42623          	sw	a5,-20(s0)
   10170:	fec42783          	lw	a5,-20(s0)
   10174:	0007871b          	sext.w	a4,a5
   10178:	00100793          	li	a5,1
   1017c:	00f71663          	bne	a4,a5,10188 <cal_n+0x30>
   10180:	fec42783          	lw	a5,-20(s0)
   10184:	02c0006f          	j	101b0 <cal_n+0x58>
   10188:	fec42783          	lw	a5,-20(s0)
   1018c:	fff7879b          	addiw	a5,a5,-1
   10190:	0007879b          	sext.w	a5,a5
   10194:	00078513          	mv	a0,a5
   10198:	fc1ff0ef          	jal	ra,10158 <cal_n>
   1019c:	00050793          	mv	a5,a0
   101a0:	00078713          	mv	a4,a5
   101a4:	fec42783          	lw	a5,-20(s0)
   101a8:	02e787bb          	mulw	a5,a5,a4
   101ac:	0007879b          	sext.w	a5,a5
   101b0:	00078513          	mv	a0,a5
   101b4:	01813083          	ld	ra,24(sp)
   101b8:	01013403          	ld	s0,16(sp)
   101bc:	02010113          	addi	sp,sp,32
   101c0:	00008067          	ret

00000000000101c4 <main>:
   101c4:	ff010113          	addi	sp,sp,-16
   101c8:	00113423          	sd	ra,8(sp)
   101cc:	00813023          	sd	s0,0(sp)
   101d0:	01010413          	addi	s0,sp,16
   101d4:	00a00513          	li	a0,10
   101d8:	f81ff0ef          	jal	ra,10158 <cal_n>
   101dc:	00050793          	mv	a5,a0
   101e0:	00078713          	mv	a4,a5
   101e4:	f6e1a023          	sw	a4,-160(gp) # 11cc8 <_edata>
   101e8:	f601a783          	lw	a5,-160(gp) # 11cc8 <_edata>
   101ec:	00078513          	mv	a0,a5
   101f0:	024000ef          	jal	ra,10214 <PrintInt>
   101f4:	00a00513          	li	a0,10
   101f8:	048000ef          	jal	ra,10240 <PrintChar>
   101fc:	00000793          	li	a5,0
   10200:	00078513          	mv	a0,a5
   10204:	00813083          	ld	ra,8(sp)
   10208:	00013403          	ld	s0,0(sp)
   1020c:	01010113          	addi	sp,sp,16
   10210:	00008067          	ret

0000000000010214 <PrintInt>:
   10214:	fe010113          	addi	sp,sp,-32
   10218:	00813c23          	sd	s0,24(sp)
   1021c:	02010413          	addi	s0,sp,32
   10220:	00050793          	mv	a5,a0
   10224:	fef42623          	sw	a5,-20(s0)
   10228:	00000893          	li	a7,0
   1022c:	00000073          	ecall
   10230:	00000013          	nop
   10234:	01813403          	ld	s0,24(sp)
   10238:	02010113          	addi	sp,sp,32
   1023c:	00008067          	ret

0000000000010240 <PrintChar>:
   10240:	fe010113          	addi	sp,sp,-32
   10244:	00813c23          	sd	s0,24(sp)
   10248:	02010413          	addi	s0,sp,32
   1024c:	00050793          	mv	a5,a0
   10250:	fef407a3          	sb	a5,-17(s0)
   10254:	00100893          	li	a7,1
   10258:	00000073          	ecall
   1025c:	00000013          	nop
   10260:	01813403          	ld	s0,24(sp)
   10264:	02010113          	addi	sp,sp,32
   10268:	00008067          	ret

000000000001026c <exit>:
   1026c:	1141                	addi	sp,sp,-16
   1026e:	4581                	li	a1,0
   10270:	e022                	sd	s0,0(sp)
   10272:	e406                	sd	ra,8(sp)
   10274:	842a                	mv	s0,a0
   10276:	128000ef          	jal	ra,1039e <__call_exitprocs>
   1027a:	f481b503          	ld	a0,-184(gp) # 11cb0 <_global_impure_ptr>
   1027e:	6d3c                	ld	a5,88(a0)
   10280:	c391                	beqz	a5,10284 <exit+0x18>
   10282:	9782                	jalr	a5
   10284:	8522                	mv	a0,s0
   10286:	28e000ef          	jal	ra,10514 <_exit>

000000000001028a <__libc_init_array>:
   1028a:	1101                	addi	sp,sp,-32
   1028c:	e822                	sd	s0,16(sp)
   1028e:	e04a                	sd	s2,0(sp)
   10290:	6445                	lui	s0,0x11
   10292:	6945                	lui	s2,0x11
   10294:	54c40793          	addi	a5,s0,1356 # 1154c <__preinit_array_end>
   10298:	54c90913          	addi	s2,s2,1356 # 1154c <__preinit_array_end>
   1029c:	40f90933          	sub	s2,s2,a5
   102a0:	ec06                	sd	ra,24(sp)
   102a2:	e426                	sd	s1,8(sp)
   102a4:	40395913          	srai	s2,s2,0x3
   102a8:	00090b63          	beqz	s2,102be <__libc_init_array+0x34>
   102ac:	54c40413          	addi	s0,s0,1356
   102b0:	4481                	li	s1,0
   102b2:	601c                	ld	a5,0(s0)
   102b4:	0485                	addi	s1,s1,1
   102b6:	0421                	addi	s0,s0,8
   102b8:	9782                	jalr	a5
   102ba:	fe991ce3          	bne	s2,s1,102b2 <__libc_init_array+0x28>
   102be:	6445                	lui	s0,0x11
   102c0:	6945                	lui	s2,0x11
   102c2:	55040793          	addi	a5,s0,1360 # 11550 <__init_array_start>
   102c6:	56090913          	addi	s2,s2,1376 # 11560 <__init_array_end>
   102ca:	40f90933          	sub	s2,s2,a5
   102ce:	40395913          	srai	s2,s2,0x3
   102d2:	00090b63          	beqz	s2,102e8 <__libc_init_array+0x5e>
   102d6:	55040413          	addi	s0,s0,1360
   102da:	4481                	li	s1,0
   102dc:	601c                	ld	a5,0(s0)
   102de:	0485                	addi	s1,s1,1
   102e0:	0421                	addi	s0,s0,8
   102e2:	9782                	jalr	a5
   102e4:	fe991ce3          	bne	s2,s1,102dc <__libc_init_array+0x52>
   102e8:	60e2                	ld	ra,24(sp)
   102ea:	6442                	ld	s0,16(sp)
   102ec:	64a2                	ld	s1,8(sp)
   102ee:	6902                	ld	s2,0(sp)
   102f0:	6105                	addi	sp,sp,32
   102f2:	8082                	ret

00000000000102f4 <memset>:
   102f4:	433d                	li	t1,15
   102f6:	872a                	mv	a4,a0
   102f8:	02c37163          	bgeu	t1,a2,1031a <memset+0x26>
   102fc:	00f77793          	andi	a5,a4,15
   10300:	e3c1                	bnez	a5,10380 <memset+0x8c>
   10302:	e1bd                	bnez	a1,10368 <memset+0x74>
   10304:	ff067693          	andi	a3,a2,-16
   10308:	8a3d                	andi	a2,a2,15
   1030a:	96ba                	add	a3,a3,a4
   1030c:	e30c                	sd	a1,0(a4)
   1030e:	e70c                	sd	a1,8(a4)
   10310:	0741                	addi	a4,a4,16
   10312:	fed76de3          	bltu	a4,a3,1030c <memset+0x18>
   10316:	e211                	bnez	a2,1031a <memset+0x26>
   10318:	8082                	ret
   1031a:	40c306b3          	sub	a3,t1,a2
   1031e:	068a                	slli	a3,a3,0x2
   10320:	00000297          	auipc	t0,0x0
   10324:	9696                	add	a3,a3,t0
   10326:	00a68067          	jr	10(a3)
   1032a:	00b70723          	sb	a1,14(a4)
   1032e:	00b706a3          	sb	a1,13(a4)
   10332:	00b70623          	sb	a1,12(a4)
   10336:	00b705a3          	sb	a1,11(a4)
   1033a:	00b70523          	sb	a1,10(a4)
   1033e:	00b704a3          	sb	a1,9(a4)
   10342:	00b70423          	sb	a1,8(a4)
   10346:	00b703a3          	sb	a1,7(a4)
   1034a:	00b70323          	sb	a1,6(a4)
   1034e:	00b702a3          	sb	a1,5(a4)
   10352:	00b70223          	sb	a1,4(a4)
   10356:	00b701a3          	sb	a1,3(a4)
   1035a:	00b70123          	sb	a1,2(a4)
   1035e:	00b700a3          	sb	a1,1(a4)
   10362:	00b70023          	sb	a1,0(a4)
   10366:	8082                	ret
   10368:	0ff5f593          	andi	a1,a1,255
   1036c:	00859693          	slli	a3,a1,0x8
   10370:	8dd5                	or	a1,a1,a3
   10372:	01059693          	slli	a3,a1,0x10
   10376:	8dd5                	or	a1,a1,a3
   10378:	02059693          	slli	a3,a1,0x20
   1037c:	8dd5                	or	a1,a1,a3
   1037e:	b759                	j	10304 <memset+0x10>
   10380:	00279693          	slli	a3,a5,0x2
   10384:	00000297          	auipc	t0,0x0
   10388:	9696                	add	a3,a3,t0
   1038a:	8286                	mv	t0,ra
   1038c:	fa2680e7          	jalr	-94(a3)
   10390:	8096                	mv	ra,t0
   10392:	17c1                	addi	a5,a5,-16
   10394:	8f1d                	sub	a4,a4,a5
   10396:	963e                	add	a2,a2,a5
   10398:	f8c371e3          	bgeu	t1,a2,1031a <memset+0x26>
   1039c:	b79d                	j	10302 <memset+0xe>

000000000001039e <__call_exitprocs>:
   1039e:	715d                	addi	sp,sp,-80
   103a0:	f052                	sd	s4,32(sp)
   103a2:	f481ba03          	ld	s4,-184(gp) # 11cb0 <_global_impure_ptr>
   103a6:	f84a                	sd	s2,48(sp)
   103a8:	e486                	sd	ra,72(sp)
   103aa:	1f8a3903          	ld	s2,504(s4)
   103ae:	e0a2                	sd	s0,64(sp)
   103b0:	fc26                	sd	s1,56(sp)
   103b2:	f44e                	sd	s3,40(sp)
   103b4:	ec56                	sd	s5,24(sp)
   103b6:	e85a                	sd	s6,16(sp)
   103b8:	e45e                	sd	s7,8(sp)
   103ba:	e062                	sd	s8,0(sp)
   103bc:	02090863          	beqz	s2,103ec <__call_exitprocs+0x4e>
   103c0:	8b2a                	mv	s6,a0
   103c2:	8bae                	mv	s7,a1
   103c4:	4a85                	li	s5,1
   103c6:	59fd                	li	s3,-1
   103c8:	00892483          	lw	s1,8(s2)
   103cc:	fff4841b          	addiw	s0,s1,-1
   103d0:	00044e63          	bltz	s0,103ec <__call_exitprocs+0x4e>
   103d4:	048e                	slli	s1,s1,0x3
   103d6:	94ca                	add	s1,s1,s2
   103d8:	020b8663          	beqz	s7,10404 <__call_exitprocs+0x66>
   103dc:	2084b783          	ld	a5,520(s1)
   103e0:	03778263          	beq	a5,s7,10404 <__call_exitprocs+0x66>
   103e4:	347d                	addiw	s0,s0,-1
   103e6:	14e1                	addi	s1,s1,-8
   103e8:	ff3418e3          	bne	s0,s3,103d8 <__call_exitprocs+0x3a>
   103ec:	60a6                	ld	ra,72(sp)
   103ee:	6406                	ld	s0,64(sp)
   103f0:	74e2                	ld	s1,56(sp)
   103f2:	7942                	ld	s2,48(sp)
   103f4:	79a2                	ld	s3,40(sp)
   103f6:	7a02                	ld	s4,32(sp)
   103f8:	6ae2                	ld	s5,24(sp)
   103fa:	6b42                	ld	s6,16(sp)
   103fc:	6ba2                	ld	s7,8(sp)
   103fe:	6c02                	ld	s8,0(sp)
   10400:	6161                	addi	sp,sp,80
   10402:	8082                	ret
   10404:	00892783          	lw	a5,8(s2)
   10408:	6498                	ld	a4,8(s1)
   1040a:	37fd                	addiw	a5,a5,-1
   1040c:	04878463          	beq	a5,s0,10454 <__call_exitprocs+0xb6>
   10410:	0004b423          	sd	zero,8(s1)
   10414:	db61                	beqz	a4,103e4 <__call_exitprocs+0x46>
   10416:	31092783          	lw	a5,784(s2)
   1041a:	008a96bb          	sllw	a3,s5,s0
   1041e:	00892c03          	lw	s8,8(s2)
   10422:	8ff5                	and	a5,a5,a3
   10424:	2781                	sext.w	a5,a5
   10426:	ef89                	bnez	a5,10440 <__call_exitprocs+0xa2>
   10428:	9702                	jalr	a4
   1042a:	00892703          	lw	a4,8(s2)
   1042e:	1f8a3783          	ld	a5,504(s4)
   10432:	01871463          	bne	a4,s8,1043a <__call_exitprocs+0x9c>
   10436:	faf907e3          	beq	s2,a5,103e4 <__call_exitprocs+0x46>
   1043a:	dbcd                	beqz	a5,103ec <__call_exitprocs+0x4e>
   1043c:	893e                	mv	s2,a5
   1043e:	b769                	j	103c8 <__call_exitprocs+0x2a>
   10440:	31492783          	lw	a5,788(s2)
   10444:	1084b583          	ld	a1,264(s1)
   10448:	8ff5                	and	a5,a5,a3
   1044a:	2781                	sext.w	a5,a5
   1044c:	e799                	bnez	a5,1045a <__call_exitprocs+0xbc>
   1044e:	855a                	mv	a0,s6
   10450:	9702                	jalr	a4
   10452:	bfe1                	j	1042a <__call_exitprocs+0x8c>
   10454:	00892423          	sw	s0,8(s2)
   10458:	bf75                	j	10414 <__call_exitprocs+0x76>
   1045a:	852e                	mv	a0,a1
   1045c:	9702                	jalr	a4
   1045e:	b7f1                	j	1042a <__call_exitprocs+0x8c>

0000000000010460 <__libc_fini_array>:
   10460:	1101                	addi	sp,sp,-32
   10462:	e822                	sd	s0,16(sp)
   10464:	67c5                	lui	a5,0x11
   10466:	6445                	lui	s0,0x11
   10468:	56040413          	addi	s0,s0,1376 # 11560 <__init_array_end>
   1046c:	56878793          	addi	a5,a5,1384 # 11568 <__fini_array_end>
   10470:	8f81                	sub	a5,a5,s0
   10472:	e426                	sd	s1,8(sp)
   10474:	ec06                	sd	ra,24(sp)
   10476:	4037d493          	srai	s1,a5,0x3
   1047a:	c881                	beqz	s1,1048a <__libc_fini_array+0x2a>
   1047c:	17e1                	addi	a5,a5,-8
   1047e:	943e                	add	s0,s0,a5
   10480:	601c                	ld	a5,0(s0)
   10482:	14fd                	addi	s1,s1,-1
   10484:	1461                	addi	s0,s0,-8
   10486:	9782                	jalr	a5
   10488:	fce5                	bnez	s1,10480 <__libc_fini_array+0x20>
   1048a:	60e2                	ld	ra,24(sp)
   1048c:	6442                	ld	s0,16(sp)
   1048e:	64a2                	ld	s1,8(sp)
   10490:	6105                	addi	sp,sp,32
   10492:	8082                	ret

0000000000010494 <atexit>:
   10494:	85aa                	mv	a1,a0
   10496:	4681                	li	a3,0
   10498:	4601                	li	a2,0
   1049a:	4501                	li	a0,0
   1049c:	a009                	j	1049e <__register_exitproc>

000000000001049e <__register_exitproc>:
   1049e:	f481b703          	ld	a4,-184(gp) # 11cb0 <_global_impure_ptr>
   104a2:	1f873783          	ld	a5,504(a4)
   104a6:	c3b1                	beqz	a5,104ea <__register_exitproc+0x4c>
   104a8:	4798                	lw	a4,8(a5)
   104aa:	487d                	li	a6,31
   104ac:	06e84263          	blt	a6,a4,10510 <__register_exitproc+0x72>
   104b0:	c505                	beqz	a0,104d8 <__register_exitproc+0x3a>
   104b2:	00371813          	slli	a6,a4,0x3
   104b6:	983e                	add	a6,a6,a5
   104b8:	10c83823          	sd	a2,272(a6)
   104bc:	3107a883          	lw	a7,784(a5)
   104c0:	4605                	li	a2,1
   104c2:	00e6163b          	sllw	a2,a2,a4
   104c6:	00c8e8b3          	or	a7,a7,a2
   104ca:	3117a823          	sw	a7,784(a5)
   104ce:	20d83823          	sd	a3,528(a6)
   104d2:	4689                	li	a3,2
   104d4:	02d50063          	beq	a0,a3,104f4 <__register_exitproc+0x56>
   104d8:	00270693          	addi	a3,a4,2
   104dc:	068e                	slli	a3,a3,0x3
   104de:	2705                	addiw	a4,a4,1
   104e0:	c798                	sw	a4,8(a5)
   104e2:	97b6                	add	a5,a5,a3
   104e4:	e38c                	sd	a1,0(a5)
   104e6:	4501                	li	a0,0
   104e8:	8082                	ret
   104ea:	20070793          	addi	a5,a4,512
   104ee:	1ef73c23          	sd	a5,504(a4)
   104f2:	bf5d                	j	104a8 <__register_exitproc+0xa>
   104f4:	3147a683          	lw	a3,788(a5)
   104f8:	4501                	li	a0,0
   104fa:	8e55                	or	a2,a2,a3
   104fc:	00270693          	addi	a3,a4,2
   10500:	068e                	slli	a3,a3,0x3
   10502:	2705                	addiw	a4,a4,1
   10504:	30c7aa23          	sw	a2,788(a5)
   10508:	c798                	sw	a4,8(a5)
   1050a:	97b6                	add	a5,a5,a3
   1050c:	e38c                	sd	a1,0(a5)
   1050e:	8082                	ret
   10510:	557d                	li	a0,-1
   10512:	8082                	ret

0000000000010514 <_exit>:
   10514:	4581                	li	a1,0
   10516:	4601                	li	a2,0
   10518:	4681                	li	a3,0
   1051a:	4701                	li	a4,0
   1051c:	4781                	li	a5,0
   1051e:	05d00893          	li	a7,93
   10522:	00000073          	ecall
   10526:	00054363          	bltz	a0,1052c <_exit+0x18>
   1052a:	a001                	j	1052a <_exit+0x16>
   1052c:	1141                	addi	sp,sp,-16
   1052e:	e022                	sd	s0,0(sp)
   10530:	842a                	mv	s0,a0
   10532:	e406                	sd	ra,8(sp)
   10534:	4080043b          	negw	s0,s0
   10538:	008000ef          	jal	ra,10540 <__errno>
   1053c:	c100                	sw	s0,0(a0)
   1053e:	a001                	j	1053e <_exit+0x2a>

0000000000010540 <__errno>:
   10540:	f581b503          	ld	a0,-168(gp) # 11cc0 <_impure_ptr>
   10544:	8082                	ret
