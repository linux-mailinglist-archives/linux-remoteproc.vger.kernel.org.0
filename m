Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A521AEF101
	for <lists+linux-remoteproc@lfdr.de>; Tue,  5 Nov 2019 00:02:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730435AbfKDXC0 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 4 Nov 2019 18:02:26 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:46900 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730423AbfKDXCY (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 4 Nov 2019 18:02:24 -0500
Received: by mail-pl1-f196.google.com with SMTP id l4so3147490plt.13
        for <linux-remoteproc@vger.kernel.org>; Mon, 04 Nov 2019 15:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=X1UnPHKL+R2cZ8Kw6+/720/J4o7/qh5ZTT6nGad7uFc=;
        b=iJe75S+XWatVO63vpa8OCbttobDDRXQDHpSA5POIQeMX6fxWDxN1H+2wJfuKHyYmTS
         RIhDArF/B/r+170+sXr+ID3efg8y8ySEksy6z5I+vysegvbqELJ3APp8lJ7qTjd7c09v
         gI2LjD4oCRQyGn3+tUh3VdjHZa1wbmYqWP0fEdWZPioPeEg7cVGZwdj95xbbEvViTGgH
         cfBOEnX/XnPno7W/cVSyA06kwTAWDkQ2koWsYydlRwAKweAeLlYjT2lr5Rf3FD+QtgWi
         SJrC3G3LxdjHS4q/3DtzL9g1Fosjk8dT97hozl42iabPuetbLeRleKLkQmFajWs7waIi
         /iEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=X1UnPHKL+R2cZ8Kw6+/720/J4o7/qh5ZTT6nGad7uFc=;
        b=Ntye5XAwJaTgHI1JSKd1Tf5YNHxquQCoEkL1y+UkRkJuApJnyFnGfwcu+dJq3YLQqb
         5CrW2yh2gzpzoHWNm397BNDqGL9tFvCG+s8oiiXx1c+zMfDOgFeCu/zgeXJc1XKK1oZt
         WryTiMy4e+h+G5e5LX1XY8Xg4MGxWDvQ0LXzBFKGyAZVJ6ccOoC1MXlUbxML3gymX+HQ
         b745ErmBOr/Mhe+XcskzF6iiIyWJ2CsMAkfABfsRzKp6LOvDvJL7vicJZ16pwk2qJI/I
         FuhaqmxKch8zVxhhCLMNTHn2Z7PUgg1YXIKB7zCkGbaU7PRtQMUU5D+S1xN3UJrC9/N4
         4L/A==
X-Gm-Message-State: APjAAAWfS4TghOQWXlNErJf0MY78XaWOJcpaiyex6zzmCYqk9LNiWMoR
        31v+VuQOnw+ZCBmASNDdqxOdBw==
X-Google-Smtp-Source: APXvYqzJHtTwMH1ADOHC49u97iZoDWvrf1I4qV/BP7/Ne+/CYjKqqJfdSXB04ZCFwKG8gk7W+BrYNA==
X-Received: by 2002:a17:902:9a92:: with SMTP id w18mr29336869plp.186.1572908541755;
        Mon, 04 Nov 2019 15:02:21 -0800 (PST)
Received: from tuxbook-pro (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id q184sm18357035pfc.111.2019.11.04.15.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 15:02:21 -0800 (PST)
Date:   Mon, 4 Nov 2019 15:02:19 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     agross@kernel.org, ohad@wizery.com, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Support for MSM8998 mss
Message-ID: <20191104230219.GA5505@tuxbook-pro>
References: <20191101024301.21919-1-jeffrey.l.hugo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191101024301.21919-1-jeffrey.l.hugo@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu 31 Oct 19:43 PDT 2019, Jeffrey Hugo wrote:

> Booting mss on MSM8998 is a critical step to getting wifi functional - a
> rather useful feature for the MSM8998 based laptops.
> 

Thanks, and thanks for the review Rob!

Applied,
Bjorn

> Jeffrey Hugo (2):
>   dt-bindings: remoteproc: qcom: Add Q6v5 Modem PIL binding for MSM8998
>   remoteproc: qcom_q6v5_mss: Add support for MSM8998
> 
>  .../bindings/remoteproc/qcom,q6v5.txt         |  6 +++
>  drivers/remoteproc/qcom_q6v5_mss.c            | 52 ++++++++++++++++---
>  2 files changed, 52 insertions(+), 6 deletions(-)
> 
> -- 
> 2.17.1
> 
