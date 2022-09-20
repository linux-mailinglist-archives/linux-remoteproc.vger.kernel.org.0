Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F8B85BF03C
	for <lists+linux-remoteproc@lfdr.de>; Wed, 21 Sep 2022 00:37:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229655AbiITWhj (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 20 Sep 2022 18:37:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229598AbiITWhh (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 20 Sep 2022 18:37:37 -0400
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com [IPv6:2001:4860:4864:20::2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF7A761D72
        for <linux-remoteproc@vger.kernel.org>; Tue, 20 Sep 2022 15:37:33 -0700 (PDT)
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-1279948d93dso6450746fac.10
        for <linux-remoteproc@vger.kernel.org>; Tue, 20 Sep 2022 15:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :mime-version:from:to:cc:subject:date;
        bh=5GtNkJQh9kU1Zbo1ufMd9zp4+XlJQcIXTmH8ucifWR4=;
        b=CbCKn2urOFkFWvlaj1gxVo3Wh+tk/N7k7XCqBvsIAzMCsswiqtue+D5kCoXo0Da3lo
         qMaLi/KuqM/70vjDDkZyFR2E3xQhZHgCRDZM8D39NpA+FV7Ym2D98zUKHXp9RAjGRHQu
         l3KvicAD/IvMFDkM6dpszS0YNPk8GtWsN+w6TPyhLlqmsfnMsXPSBXWKvgKcKThQ+gBD
         IyB1osJXa0kgwrGKMJBR77qYThjX1q578FjGgnLdP6Y6vsXhDHJbTp6wMNXT7FEp4f51
         71QG6y3y2e8t2aRW0PsotLqErg/wP6VKMshzy6ILGDE+LST1Wsb6urBRTzohFq9oZPIS
         6/Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=5GtNkJQh9kU1Zbo1ufMd9zp4+XlJQcIXTmH8ucifWR4=;
        b=pKtB5a8EIQtdMRkXxGu6OHGC0ke+Xup0dsASR2Xibv0BlGSLxZ3jNMqURlMpF8Tfb/
         3PBKhUwENcS+EDr0r+Kev2E2pfOwx1d68BiA7dFbmPYkRHmY/NxunVmZOY1LiKyVOIim
         wteKpVIE4O/pr3DvtJgfX6VMicBxTYASRaCLjDiHDvqK6TCegDlAtzKYXfn8axkFL/IH
         gYjysFBl+8H3EmsH0wH8BBTiXKKHWTcBEZ2zbtkDOVQrdrB9POXUGniB9TGllgnHgobG
         cFLJhxSDa58qauO8eBzw5zX2YCx97Tx8b5w1Bu3lAc3Lj/3eHYcemV0ANbsc1EiMaN86
         U+bg==
X-Gm-Message-State: ACrzQf3qlFkhtWOeZ2q9+EYp9Pyx7FO3Wy/IQHoIqEx2H7qnH2J2CdSw
        BbRhx8ir+jf4/+vxrqEnfnTtdr9ey/1iufKkVeg=
X-Google-Smtp-Source: AMsMyM4Yp3Xash1ksC3b9ftBgWGlzM7N2HozsidUp388jAfSGCOdCgROxezGxSk5t259zPFLYnJrFiWoTjq3vZyTzLs=
X-Received: by 2002:a05:6870:63a5:b0:127:82f6:4bb6 with SMTP id
 t37-20020a05687063a500b0012782f64bb6mr3288488oap.211.1663713452339; Tue, 20
 Sep 2022 15:37:32 -0700 (PDT)
MIME-Version: 1.0
Sender: badagbocamillo@gmail.com
Received: by 2002:a4a:2553:0:0:0:0:0 with HTTP; Tue, 20 Sep 2022 15:37:32
 -0700 (PDT)
From:   Miss Reacheal <reacheal4u@gmail.com>
Date:   Tue, 20 Sep 2022 22:37:32 +0000
X-Google-Sender-Auth: zLUut2N8P0KJ4-Xr5o9XUlDwq1o
Message-ID: <CAEU_3uAMNSYo3Si1ZoXjr15Cm7H0-v6n1+699ck_kvsLQrpJfg@mail.gmail.com>
Subject: RE:HELLO DEAR
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=1.1 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,
        T_HK_NAME_FM_MR_MRS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hallo,

Mottok du min forrige melding? Jeg kontaktet deg f=C3=B8r, men meldingen
mislyktes, s=C3=A5 jeg bestemte meg for =C3=A5 skrive igjen. Vennligst bekr=
eft
om du mottar dette slik at jeg kan fortsette,

Venter p=C3=A5 din respons.

Hilsen
Fr=C3=B8ken Reacheal
