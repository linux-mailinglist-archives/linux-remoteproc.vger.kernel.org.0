Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A63F107C02
	for <lists+linux-remoteproc@lfdr.de>; Sat, 23 Nov 2019 01:29:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726735AbfKWA36 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 22 Nov 2019 19:29:58 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:43184 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726089AbfKWA36 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 22 Nov 2019 19:29:58 -0500
Received: by mail-pl1-f194.google.com with SMTP id a18so3804121plm.10;
        Fri, 22 Nov 2019 16:29:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+AQZeDv5UqOHpZMTCf27vGknoqjGXNsTqXSKl1b2Ejk=;
        b=CqCXk07bdA0p1KvwPHwwKUCddEDulmKTreDlMAGE1BlnipvMYoTkpzbqWAvKZvppDP
         rV6p+adMWAlIGfuXc+/GRid0tGQWUv2Hq8Q4LbsBCH9jbLuuYmDkRPjYsguQ11J3Bkz3
         HKPBg7EYWzhslf5J3jEy1+zRtWupIQhwD43sqOY0+5GX6z59DuRStU5Xy+Ufmw6YEhhP
         HOMxsQNC++t2cTnkAUA2QJIiiKfr3PjW1jrk2FnqvPYZoz8qbpq+aNZcXafk/rl+/B/+
         47TbsTAbBqzpJODJed7CMTAIYI0uLx5FgqUAWcYNiTT3FY2QlCCORFanzPrzDya2QSFF
         0FnA==
X-Gm-Message-State: APjAAAWVttafJVCHm6d1hAWeGRJBd9FJrUYbqNYjb/xjt2jN13FbRldR
        ZCoiHfV58XvxLSquVIlk7Q==
X-Google-Smtp-Source: APXvYqzchwD1cusjG/lqJ4ZnXQsbhG6GBfQ2tAvLCsPH56xzATlT6s2p/1xcDlc/4JpQkrNtUfiEpA==
X-Received: by 2002:a17:902:8341:: with SMTP id z1mr17267199pln.222.1574468997207;
        Fri, 22 Nov 2019 16:29:57 -0800 (PST)
Received: from localhost ([172.58.139.180])
        by smtp.gmail.com with ESMTPSA id e24sm59656pjt.18.2019.11.22.16.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2019 16:29:56 -0800 (PST)
Date:   Fri, 22 Nov 2019 18:29:52 -0600
From:   Rob Herring <robh@kernel.org>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>, od@zcrc.me,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v3 1/4] dt-bindings: Document JZ47xx VPU auxiliary
 processor
Message-ID: <20191123002510.GA26022@bogus>
References: <20191116170846.67220-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191116170846.67220-1-paul@crapouillou.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Sat, 16 Nov 2019 18:08:43 +0100, Paul Cercueil wrote:
> Inside the Video Processing Unit (VPU) of the recent JZ47xx SoCs from
> Ingenic is a second Xburst MIPS CPU very similar to the main core.
> This document describes the devicetree bindings for this auxiliary
> processor.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
> 
> Notes:
>     v2: Update TCSM0 address in example
>     v3: Change node name to 'video-decoder'
> 
>  .../bindings/remoteproc/ingenic,vpu.txt       | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/ingenic,vpu.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
