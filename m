Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90369784E53
	for <lists+linux-remoteproc@lfdr.de>; Wed, 23 Aug 2023 03:41:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232048AbjHWBlc (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 22 Aug 2023 21:41:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230403AbjHWBlb (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 22 Aug 2023 21:41:31 -0400
X-Greylist: delayed 917 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 22 Aug 2023 18:41:29 PDT
Received: from symantec4.comsats.net.pk (symantec4.comsats.net.pk [203.124.41.30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 399A5E4C
        for <linux-remoteproc@vger.kernel.org>; Tue, 22 Aug 2023 18:41:28 -0700 (PDT)
X-AuditID: cb7c291e-06dff70000002aeb-53-64e54b4af566
Received: from iesco.comsatshosting.com (iesco.comsatshosting.com [210.56.28.11])
        (using TLS with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        by symantec4.comsats.net.pk (Symantec Messaging Gateway) with SMTP id 89.6B.10987.B4B45E46; Wed, 23 Aug 2023 04:56:59 +0500 (PKT)
DomainKey-Signature: a=rsa-sha1; c=nofws; q=dns;
        d=iesco.com.pk; s=default;
        h=received:content-type:mime-version:content-transfer-encoding
          :content-description:subject:to:from:date:reply-to;
        b=oBDJWSjioOxYbojj4Ohq0SmjJiLxf+4GyE+Lkmfu7620oMKHk6DKrZuR4lQZbgqJO
          +JOQx8mH6vk9vBQVhRyVYqgynVcRxK9zCFiKHpawRU9+CgbpkfXWXDsnjgQi/14mj
          +Rwv7UMaLu6VVmuMEIoZflfR+KisNWk5x/uq+AJb4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iesco.com.pk; s=default;
        h=reply-to:date:from:to:subject:content-description
          :content-transfer-encoding:mime-version:content-type;
        bh=GMzYzcyTxDsE6wX/XHG6MHqAdAiHrhqbmmLQ/TZ1QnQ=;
        b=Bs9KdCyIPTy0ESguEb53Rr2XRBbHLUtOC945i095PVIk6Zd4sEJZiyb0sjqllCYzT
          9ndgBc1DqNn9DW9q6WRHokRxVJzVlPEj+8OWkQj/C5FmgJwuna+4yHJC1RIUmRxOr
          fBLtlUHwP50ZLIVVieGgvTv/ML3ry/LGgUGtKKVC0=
Received: from [94.156.6.90] (UnknownHost [94.156.6.90]) by iesco.comsatshosting.com with SMTP;
   Wed, 23 Aug 2023 04:31:06 +0500
Message-ID: <89.6B.10987.B4B45E46@symantec4.comsats.net.pk>
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Re; Interest,
To:     linux-remoteproc@vger.kernel.org
From:   "Chen Yun" <pso.chairmanbod@iesco.com.pk>
Date:   Tue, 22 Aug 2023 16:31:20 -0700
Reply-To: chnyne@gmail.com
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDLMWRmVeSWpSXmKPExsVyyUKGW9fb+2mKwYV5whbN55UcGD0+b5IL
        YIzisklJzcksSy3St0vgyliy7gJLwW7mirb+RSwNjI+Zuhg5OSQETCTWzj3N2MXIxSEksIdJ
        4vypN8wgDovAamaJ7UeeskM4D5klTk28wwxR1swo8afjJhtIP6+AtcS2VytYQWxmAT2JG1On
        QMUFJU7OfMICEdeWWLbwNVAzB5CtJvG1qwQkLCwgJvFp2jJ2EFtEQEXi+7otjCA2m4C+xIqv
        zWA2i4CqxPLfi8BGCglISWy8sp5tAiP/LCTbZiHZNgvJtlkI2xYwsqxilCiuzE0EhlqyiV5y
        fm5xYkmxXl5qiV5B9iZGYBiertGU28G49FLiIUYBDkYlHt6f656kCLEmlgF1HWKU4GBWEuGV
        /v4wRYg3JbGyKrUoP76oNCe1+BCjNAeLkjivrdCzZCGB9MSS1OzU1ILUIpgsEwenVAOjt7dS
        RrnBzE3L/Ftn3CgWOCmV+IZJI/2D3f539TK8Cw50sEvPURbnZ967/eEO3yqLuk+zCz6s2rzw
        d4/jTiWXr9bmfX1pv2fODd2rd2Te85eCFd6hbUE3tJMm8FbeK9HU05pneO6o5+xb6799uLaf
        yeG1S4MHz7VN8V+0t51P2qbqlZTy8VeJEktxRqKhFnNRcSIAsdb7mz8CAAA=
X-Spam-Status: Yes, score=5.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_REPLYTO,
        RCVD_IN_DNSWL_LOW,RCVD_IN_SBL,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: *  0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was
        *      blocked.  See
        *      http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
        *      for more information.
        *      [URIs: iesco.com.pk]
        *  0.1 RCVD_IN_SBL RBL: Received via a relay in Spamhaus SBL
        *      [94.156.6.90 listed in zen.spamhaus.org]
        *  3.3 RCVD_IN_SBL_CSS RBL: Received via a relay in Spamhaus SBL-CSS
        * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at https://www.dnswl.org/,
        *       low trust
        *      [203.124.41.30 listed in list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  2.1 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Re; Interest,

I am interested in discussing the Investment proposal as I explained
in my previous mail. May you let me know your interest and the
possibility of a cooperation aimed for mutual interest.

Looking forward to your mail for further discussion.

Regards

------
Chen Yun - Chairman of CREC
China Railway Engineering Corporation - CRECG
China Railway Plaza, No.69 Fuxing Road, Haidian District, Beijing, P.R.
China

