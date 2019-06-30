Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 634185AE0D
	for <lists+linux-remoteproc@lfdr.de>; Sun, 30 Jun 2019 06:05:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725771AbfF3EF0 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Sun, 30 Jun 2019 00:05:26 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:45565 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725613AbfF3EF0 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 30 Jun 2019 00:05:26 -0400
Received: by mail-pl1-f195.google.com with SMTP id bi6so5464601plb.12
        for <linux-remoteproc@vger.kernel.org>; Sat, 29 Jun 2019 21:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=nZ4faO3Hxt6Vv9DkaePS/Kvvg767f3TOfeZ7FItgRpc=;
        b=rl7EAg+f3oXHBc8Pbo//vWa3my/Z7+d6GEro+N5fRkuf6eXL3Ar1+FGnrNGb58Nkyp
         c7f4MXGR0IHjlG7BmA/rmUzxOAnzGP6xMCHReP4yqY7rm3uihkIYFlHy3wUjZDJ+M/Zb
         I4I+XIWi4KVSVqdJxjdxlhdrAdIcqttsszNBUKYbP0wRubhUFc7zFvMQ4Icd1Vr/OWHA
         Q3y9oGRxxyPp07pxYRbtvqicG+f3Cwc8lH89BWEeheh3G9HiL3+ytCZtYrqHxKeNE6qj
         xFOCGAzC1hlSrLGFC34ZqTBi5S1XvC4x7RPzAUW2Pfb27bY6g4qhSCfWI/rBNsOVj4dh
         Ah/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=nZ4faO3Hxt6Vv9DkaePS/Kvvg767f3TOfeZ7FItgRpc=;
        b=b9wnIdjytoZB4OKlozFlUJF9SLEvx5qAX8pP1BLd0V4oTYK1cyNAve54yGbRgKqA84
         LAGy0nnHw4eSDpZKFpVAhgJ7CZXaBfR2IpCPA83gBZjBUIaQ4gjH52YrBdQfwCvk84Ax
         nOns/etGHhP83/JqLkoCDCQAKd9DhXc5weB3Dm/hL3Ns4GRnxkUKnkJc5mgb2RWuA5VB
         1F2Lp9dvEWBGoinwL56FH25jxOzsrW8r5m9wAO4JWJ8oDaVitBxwxfzbLrJtZyOkWVFH
         E5q8a+g11e6vn4Sg/U5Jjn7KT3HT3uw1AGrLrwEYZOdbS9CemMk1LEEcNTFefvb7H+ha
         5K7Q==
X-Gm-Message-State: APjAAAXMzi94EZkSb8ldONpdONN9Nfy2+IQ6aeczQP8F+y0tqIGuH+oa
        T0Pdj/5dKCyTf9PNCPFgbW16Lg==
X-Google-Smtp-Source: APXvYqxg5hDllg1TQKAIWeDHYzxBnrioiXmu06H2WlpeMePI7Rp+znhieN/1bfFWv6zaE9kfcQ+ElA==
X-Received: by 2002:a17:902:a40c:: with SMTP id p12mr21215977plq.146.1561867525153;
        Sat, 29 Jun 2019 21:05:25 -0700 (PDT)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id z13sm6984605pjn.32.2019.06.29.21.05.23
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 29 Jun 2019 21:05:24 -0700 (PDT)
Date:   Sat, 29 Jun 2019 21:05:22 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Fabien Dessenne <fabien.dessenne@st.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        linux-remoteproc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: Re: [PATCH] hwspinlock: stm32: implement the relax() ops
Message-ID: <20190630040522.GA1263@builder>
References: <1551973336-23048-1-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1551973336-23048-1-git-send-email-fabien.dessenne@st.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu 07 Mar 07:42 PST 2019, Fabien Dessenne wrote:

> Implement this optional ops, called by hwspinlock core while spinning on
> a lock, between two successive invocations of trylock().
> 
> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>

Applied

Thanks,
Bjorn

> ---
>  drivers/hwspinlock/stm32_hwspinlock.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/hwspinlock/stm32_hwspinlock.c b/drivers/hwspinlock/stm32_hwspinlock.c
> index 4418392..c8eacf4 100644
> --- a/drivers/hwspinlock/stm32_hwspinlock.c
> +++ b/drivers/hwspinlock/stm32_hwspinlock.c
> @@ -5,6 +5,7 @@
>   */
>  
>  #include <linux/clk.h>
> +#include <linux/delay.h>
>  #include <linux/hwspinlock.h>
>  #include <linux/io.h>
>  #include <linux/kernel.h>
> @@ -42,9 +43,15 @@ static void stm32_hwspinlock_unlock(struct hwspinlock *lock)
>  	writel(STM32_MUTEX_COREID, lock_addr);
>  }
>  
> +static void stm32_hwspinlock_relax(struct hwspinlock *lock)
> +{
> +	ndelay(50);
> +}
> +
>  static const struct hwspinlock_ops stm32_hwspinlock_ops = {
>  	.trylock	= stm32_hwspinlock_trylock,
>  	.unlock		= stm32_hwspinlock_unlock,
> +	.relax		= stm32_hwspinlock_relax,
>  };
>  
>  static int stm32_hwspinlock_probe(struct platform_device *pdev)
> -- 
> 2.7.4
> 
