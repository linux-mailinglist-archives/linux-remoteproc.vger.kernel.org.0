Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7424528643A
	for <lists+linux-remoteproc@lfdr.de>; Wed,  7 Oct 2020 18:31:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727788AbgJGQbu (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 7 Oct 2020 12:31:50 -0400
Received: from sonic317-26.consmr.mail.bf2.yahoo.com ([74.6.129.81]:42135 "EHLO
        sonic317-26.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727665AbgJGQbu (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 7 Oct 2020 12:31:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1602088308; bh=PxMwWzXvs+dqOoH0/FHvFmQpYH2JguaCUHYAVLLmaiw=; h=Date:From:Reply-To:Subject:References:From:Subject; b=QY4mMjtrZsyKwGvkakDs1CwexJViUhGZL6vkGCtlLbtlpR70VlCOj6KOJmIOKhPMJ1GFJsP7BMA+xL6emcLCUMNvSIA/wJ5XmYSUaulfXL12bqfFgoBbGTDLJnTZN07D7E9NGlIRIds6OD5mxMQEJYMr2GxsPnP6OiWvFbSOFHveId3R4VL4FIcL7v46+6JVsVTRrNK+750hD4lMf5wzuAIEXNEEl6y6j2rcIuA8TfQPaU2MXyHhTaCMexUgoeuhB7AsElfggJCXqiQPrL9GDHaXEnRaz9NWJB/xVRGDr72QuQtnxMK1ooVb4ymwxsrjJyB4+ie3vf+fQaIxbMt+rQ==
X-YMail-OSG: KqibTpcVM1lh7ilMze_FGdS.l4w2bHRuvJN0_0SWddKzWsMQ1ohZUbsGB8KP0T9
 CPEo9cDTd7YWfWvOh9zHyecI8Gix6_S5c1f4n4Q340Ix.xr5vN5bDaAbvDmuFpk93OSUwYmwJWtH
 bJKP65i.xUxO9.MEm_ALdAIsK3cKVbwK3yqpipt2tzI2L4nfvR76qzJVdmsxRM_Edtb8vP8bBPtG
 CXSLK7Sksg0fQDUjggi_n0AdQfAqA_SHBYBd.UF8vvJklvhqoBitmbET44F2TkYT8nXCrL4y7.YE
 Dv_0zEykODiF89_RRNGf0u01Eo.jOwEHz6mcdPvvR0azBSR7QIvxUL3JFyP2r22BM1dUyzeWNaX3
 .rkAzvmhdkjDNW3RiNHldxErKLVYe9NB.IJk7B1VEvED49HmjEdQHm2m85bu3boSvD49n7UeNzL7
 AO0adf41car14NAFVGr2qo0zOyOuf.crvpFYD6M5psXDeT5ucOLaBaXGv874XLp7BQLOc3FsLgV_
 Nqb7ATI_H.XX08EiAS3ctlZ3XaBWsfIP5Gbjqs03hmlbN5eKMdlyl8hkQKQ7JyHBTwkP9_fxnCb0
 MXR.9AG9YKBEJAu7K_9gakNjJGhJIYaqzn9vXaAo261_GmIoGsFuAlGu2bSnfpvK5S6AKuCQ1n4r
 TBngwFOJgKwn.1.nDaoeU1oOF5AzYghyyVPr9wvMpT28Wl1UHmMceyUaUyXZ7E7VCkIb9XWxPqhQ
 khd21snzX1LXzj4olnGRxqInDTYVvomGdhak0_yY.8rJwRO0puuJ7oja1Ka0NeVTBmzTLB3H1lYk
 k0YHGHRygUmBocfqjMAJenX7GdKsXCXpPppvJkJSfGCvynLjaDfQJXbMmYm.A08BFrfNBRZSn28j
 V3FfvrJMIig54mEN.fvlTXuCQMMAgDXljgZFj.sK_qehFRChxhc00.XwQeQl44S764TYdy8RLAyo
 QUsi3owcgJu7ePrQtBC5Jv8ZjS7iw88Q8AXtBdspHv_S6m9Zr78pvcO_r5gU7VJow6LBahbtZU9Y
 pBD7zltMkxzA1hG.s4Ict5K.Pj.YqtMvloK6ei5I4YPzbr8_ExaDO4zkW2hmplfP1arwDb0hBZq6
 hnxKrVrDG8_VIB5lnNRY8J8ewVwWkwxFjHdLUvsnhlm_NN.XJb5OjRgogApwP5X9gN7m5km6Wtk.
 v4MqikKOqEW_DbdE0adtKU0epkdHUyrMJ2kE8q83BS_XMwIzK2emFL9Zi2jcoQuqYEonjtcjU6ZV
 ppYtUc2lfkbXAnYqnCRL38_vt3ZY0Tyh9vwEa56VVEKFO3FDUBMrnFnIYal1xRHHo1mk9zbzx4Ck
 1dVg1Fcl3CoygYX_pxr3DybNNulFyCJL.giQRSGqRH4mo_2vhFBrMzEBb2EnV_4y2h9dIeMTRohY
 mb12QuUdV8df.rW39_A_fvyPZ8T5TZcbBxQxcFc_.dT4wqQ--
Received: from sonic.gate.mail.ne1.yahoo.com by sonic317.consmr.mail.bf2.yahoo.com with HTTP; Wed, 7 Oct 2020 16:31:48 +0000
Date:   Wed, 7 Oct 2020 16:31:20 +0000 (UTC)
From:   Marilyn Robert <fredodinga22@gmail.com>
Reply-To: marilyobert@gmail.com
Message-ID: <76863750.149980.1602088280992@mail.yahoo.com>
Subject: =?UTF-8?B?0J3QsNGY0LzQuNC70LAg0LrQsNGYINCz0L7RgdC/0L7QtNCw0YDQvtGC?=
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
References: <76863750.149980.1602088280992.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.16795 YMailNodin Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

DQoNCtCd0LDRmNC80LjQu9CwINC60LDRmCDQs9C+0YHQv9C+0LTQsNGA0L7Rgg0KDQrQiNCw0YEg
0YHRg9C8IDY4LdCz0L7QtNC40YjQvdCwINC20LXQvdCwLCDQutC+0ZjQsCDRgdGC0YDQsNC00LAg
0L7QtCDQv9GA0L7QtNC+0LvQttC10L0g0LrQsNGA0YbQuNC90L7QvCDQvdCwINC00L7RmNC60LAs
INC+0LQg0YHQuNGC0LUg0LzQtdC00LjRhtC40L3RgdC60Lgg0LjQvdC00LjQutCw0YbQuNC4LCDQ
vNC+0ZjQsNGC0LAg0YHQvtGB0YLQvtGY0LHQsCDQvdCw0LLQuNGB0YLQuNC90LAg0YHQtSDQstC7
0L7RiNC4INC4INC+0YfQuNCz0LvQtdC00L3QviDQtSDQtNC10LrQsCDQvNC+0LbQtdCx0Lgg0L3Q
tdC80LAg0LTQsCDQttC40LLQtdCw0Lwg0L/QvtCy0LXRnNC1INC+0LQg0YjQtdGB0YIg0LzQtdGB
0LXRhtC4INC60LDQutC+INGA0LXQt9GD0LvRgtCw0YIg0L3QsCDQsdGA0LfQuNC+0YIg0YDQsNGB
0YIg0Lgg0LHQvtC70LrQsNGC0LAg0YjRgtC+INGB0LUg0ZjQsNCy0YPQstCwINC60LDRmCDQvdC1
0LAuINCc0L7RmNC+0YIg0YHQvtC/0YDRg9CzINC/0L7Rh9C40L3QsCDQvdC10LrQvtC70LrRgyDQ
s9C+0LTQuNC90Lgg0L3QsNC90LDQt9Cw0LQg0Lgg0L3QsNGI0LjRgtC1INC00L7Qu9Cz0Lgg0LPQ
vtC00LjQvdC4INCx0YDQsNC6INC90LUg0LHQtdCwINCx0LvQsNCz0L7RgdC70L7QstC10L3QuCDR
gdC+INC90LjRgtGDINC10LTQvdC+INC00LXRgtC1LCDQv9C+INC90LXQs9C+0LLQsNGC0LAg0YHQ
vNGA0YIg0LPQviDQvdCw0YHQu9C10LTQuNCyINGG0LXQu9C+0YLQviDQvdC10LPQvtCy0L4g0LHQ
vtCz0LDRgtGB0YLQstC+Lg0KDQrQlNC+0LDRk9Cw0Lwg0LrQsNGYINCy0LDRgSDQvtGC0LrQsNC6
0L4g0YHQtSDQv9C+0LzQvtC70LjQsiDQt9CwINGC0L7QsCwg0L/QvtC00LPQvtGC0LLQtdC9INGB
0YPQvCDQtNCwINC00L7QvdC40YDQsNC8INGB0YPQvNCwINC+0LQgMiwgMzAwLCAwMDAg0LXQstGA
0LAg0LfQsCDQv9C+0LzQvtGIINC90LAg0YHQuNGA0L7QvNCw0YjQvdC40YLQtSwg0YHQuNGA0L7Q
vNCw0YjQvdC40YLQtSDQuCDQv9C+0LzQsNC70LrRgyDQv9GA0LjQstC40LvQtdCz0LjRgNCw0L3Q
uNGC0LUg0LzQtdGT0YMg0LLQsNGI0LjRgtC1INGB0L7QsdGA0LDQvdC40ZjQsCAvINC+0L/RiNGC
0LXRgdGC0LLQvi4g0JfQsNCx0LXQu9C10LbQtdGC0LUg0LTQtdC60LAg0L7QstC+0Zgg0YTQvtC9
0LQg0LUg0LTQtdC/0L7QvdC40YDQsNC9INCy0L4g0LHQsNC90LrQsCDQutCw0LTQtSDRiNGC0L4g
0YDQsNCx0L7RgtC10YjQtSDQvNC+0ZjQvtGCINGB0L7Qv9GA0YPQsy4gQXBwcmVjaWF0ZdC1INGG
0LXQvdCw0Lwg0LDQutC+INC+0LHRgNC90LXRgtC1INCy0L3QuNC80LDQvdC40LUg0L3QsCDQvNC+
0LXRgtC+INCx0LDRgNCw0ZrQtSDQt9CwINC/0YDQvtC/0LDQs9C40YDQsNGa0LUg0L3QsCDQvNCw
0YHQsNC20LDRgtCwINC90LAg0LrRgNCw0LvRgdGC0LLQvtGC0L4sINGc0LUg0LLQuCDQtNCw0LTQ
sNC8INC/0L7QstC10ZzQtSDQtNC10YLQsNC70Lgg0LfQsCDRgtC+0LAg0LrQsNC60L4g0LTQsCDQ
v9C+0YHRgtCw0L/QuNGC0LUuDQoNCtCR0LvQsNCz0L7QtNCw0YDQsNC8DQrQky3Rk9CwINCc0LXR
gNC40LvQuNC9INCg0L7QsdC10YDRgg==
