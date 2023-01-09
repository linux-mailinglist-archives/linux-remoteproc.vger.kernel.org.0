Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CC8E662DB9
	for <lists+linux-remoteproc@lfdr.de>; Mon,  9 Jan 2023 18:55:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231811AbjAIRzL (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 9 Jan 2023 12:55:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237379AbjAIRyd (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 9 Jan 2023 12:54:33 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C91F58D0F
        for <linux-remoteproc@vger.kernel.org>; Mon,  9 Jan 2023 09:50:27 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id bu8so14189102lfb.4
        for <linux-remoteproc@vger.kernel.org>; Mon, 09 Jan 2023 09:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mV5PeBWjbAt+jdxJk/6pzFPhbIuu2htqwYYpEc7BluY=;
        b=O21Y088DfhgYx7nmpVRhnfzYm7dzDKNfNAHKdO0vGsP4P89iaMsx9Fi6HKweeK0fWy
         29n2abD9OxSZCVI1gOjdVSRdaVWbo9/hSsGjJFmF/2KdLv+aEraR69ulaBxUrpcIAZSq
         h2h5ufuHmtEzlGVrZKHBUOvcJS1f3FuaSCMt4Ki2Lk1Ki+oGg/Aq+X1uHwIfwPJYkQWP
         WHdMbN7eNfxEuUfXbRCyiYpQ0MAh3F4paFzKVGnnCSpbz6GVLYZgZbuEY+Ft5E9M1yd+
         SBg8A7SO6SEd7RSmTOXzjk3SNYyRlUwS6zsg3u6nN6B2DBJZzHuDwAmouAEnEDbJC70X
         NJKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mV5PeBWjbAt+jdxJk/6pzFPhbIuu2htqwYYpEc7BluY=;
        b=qsFIG06SD3eI5Bh47VlUeSSvuujAT26F97/maR8ifwfGg5XmE3zdT4Z4xQ8m0GpbxF
         3udgsIBgvuvuTgiUZQqm/G0mRK+HyobR5veMz0FvusJbhhNxLOrXs6YdBqtBkMmIrT8o
         1wdPbCmc+KafX1X2xyBGwHQbAZpsmcZgWVgXoyalwQefJpmovJV171G20YHer+b+xFgR
         fe/vfrcS2E9c61pA4O24hM60yNGjObkjP8eOJP0A6WUKuiZglQIKlOfQIl1eA1CjXYNY
         fUWm1odvHjJ/TQdGRm2y8R3M/satVe083MALXyKeoOql/m6ZISXRfOLPvc9lboupfeep
         hYwg==
X-Gm-Message-State: AFqh2koOQt3QizWSG8c9t+fjlnWkloSetcu/PRGo81ZcigVnbMaUb1vl
        zO7fjPjiA94OmGcoRQW8A/IxWUIi0Osdtgvbh/I=
X-Google-Smtp-Source: AMrXdXtAHEYwtfuj1zAjaVtdC/P6Kr5BfniRZMBdg5ZsiY7IysVG2N1512oDJ0ES3gSKYUS5uTLBw39frTHKJzcWVPI=
X-Received: by 2002:a19:4f13:0:b0:4cb:20b3:e7f4 with SMTP id
 d19-20020a194f13000000b004cb20b3e7f4mr3867379lfb.194.1673286606783; Mon, 09
 Jan 2023 09:50:06 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6022:3122:b0:35:2af5:3578 with HTTP; Mon, 9 Jan 2023
 09:50:04 -0800 (PST)
Reply-To: jb7148425@gmail.com
From:   James b <b248074@gmail.com>
Date:   Mon, 9 Jan 2023 17:50:04 +0000
Message-ID: <CAENsMjM4uf0UsWga21f7mT=p8AUQJVL1mkT9FUD4GaefYpp5Pg@mail.gmail.com>
Subject: Good day,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=6.0 required=5.0 tests=BAYES_80,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: *  2.0 BAYES_80 BODY: Bayes spam probability is 80 to 95%
        *      [score: 0.8366]
        * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:12c listed in]
        [list.dnswl.org]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [jb7148425[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [b248074[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [b248074[at]gmail.com]
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  2.7 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Greetings and the peace of the Lord be with you. I send this message
with a painful and broken heart. please get back to me as soon as
possible. I have a there is a confidential matter to be discussed with
you.  Regards
