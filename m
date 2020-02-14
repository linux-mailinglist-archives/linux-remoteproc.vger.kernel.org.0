Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CD2F15D145
	for <lists+linux-remoteproc@lfdr.de>; Fri, 14 Feb 2020 05:57:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728723AbgBNE53 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 13 Feb 2020 23:57:29 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:37239 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728708AbgBNE53 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 13 Feb 2020 23:57:29 -0500
Received: by mail-pl1-f195.google.com with SMTP id c23so3260115plz.4
        for <linux-remoteproc@vger.kernel.org>; Thu, 13 Feb 2020 20:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Oqu5dByWhUsTcLbgcHAaKlo5En4mZCmBir5nj2HwpTQ=;
        b=n6O7ZelHX94glmhMjMGvdu56eA+DSlizoPxIXZLUVpsrCpmVn2xEDa13FbDci4mmIo
         O4TunmsnYP8BRWDvd43t/Rlm2N/Em8bUnefMdgm4geuy52pDrI6FGNvj1u5VXLIB8We0
         z4yLTL1SriLEkPDLq7igHvNi0ZZiapI7YYoC5TgxoAYRTA0oRPSYO+RKtrSvHvoxmGde
         j0YyHt32uqWIWm68GGAvKCsK/bsvT8UhZjgM3ZfZE+iJ+qjHid2rJh6SYaXARRS7vmj9
         bExIEZfPoQ1tVT/ADiwz7/VTj2ennHgpqLMXWmqDXT1jkPmxeM1rNNSX7ZrS/bDQZwcc
         Podg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Oqu5dByWhUsTcLbgcHAaKlo5En4mZCmBir5nj2HwpTQ=;
        b=R9DBd4o8TJ9waN6deUEqcof8L7GueP+iAyYAZPW/zPdLFDY8l3VV3GyTBJ49huu39C
         EwVlJjO5JixKSJ062KVPdYSzhFJ/Br+dxKLEjOQhxXzJcAx36dQ/S9y9hE6AvshULc3R
         Ktkd8FRv0HBAHSs3szRnctjSzeTW2LPiof+WQC32J2eG8SUrSq39vQl8lj+a3dLO/Zrb
         BSKp4LPsFSoMNq4hxLBJXVEvWOJEl+hhbvZZWgwdGr9J5Pj8chh8ri63XMlemEb4xuGU
         82fmXDgcYlMxPhGOEbqvZ5OQ+x0CIseqhES5ZCThb9pnGQ1ZELOEskRfJv/Wcx/DM9dm
         r4UQ==
X-Gm-Message-State: APjAAAVdeX6Xuk9S5426Y1bG0RgYI7xGtPo8vF5zi5ptOaF7DY7SuMEF
        1yqYDsmtxxU6HtFM9dKfFOor5w==
X-Google-Smtp-Source: APXvYqx6c/Oq/DJ+FfuRU2+zRP3Vq4zxWIgDCs7lRWP4DFiGtsIUPqxp5yIiKXI3eP7QrubZEYnL/A==
X-Received: by 2002:a17:902:a711:: with SMTP id w17mr1520750plq.152.1581656248269;
        Thu, 13 Feb 2020 20:57:28 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id g24sm5030467pfk.92.2020.02.13.20.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2020 20:57:27 -0800 (PST)
Date:   Thu, 13 Feb 2020 20:57:25 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sibi Sankar <sibis@codeaurora.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>
Subject: Re: [PATCH v3 2/8] remoteproc: qcom: Introduce driver to store pil
 info in IMEM
Message-ID: <20200214045725.GT3948@builder>
References: <20200211005059.1377279-1-bjorn.andersson@linaro.org>
 <20200211005059.1377279-3-bjorn.andersson@linaro.org>
 <158164774404.184098.8855626264878132058@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <158164774404.184098.8855626264878132058@swboyd.mtv.corp.google.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu 13 Feb 18:35 PST 2020, Stephen Boyd wrote:
> Quoting Bjorn Andersson (2020-02-10 16:50:53)
> > diff --git a/drivers/remoteproc/qcom_pil_info.c b/drivers/remoteproc/qcom_pil_info.c
[..]
> > +       mutex_lock(&reloc_mutex);
> > +       _reloc = reloc;
> > +       mutex_unlock(&reloc_mutex);
> 
> Ah ok, I see that mutex is protecting the pointer used for everything.
> Ignore the comment above. But also, why not have every remoteproc device
> point at some imem and then search through the imem for the name? Then
> we don't need this driver or a lock that synchronizes these things.
> Ideally we could dedicate a place in imem for each remoteproc and not
> even have to search it for the string to update. Is that possible? Then
> it becomes even simpler because the DT binding can point directly at the
> address to write. It's not like the various images are changing that
> much to the point where this location in imem is actually changing,
> right?
> 

I will check to see if these entries needs to be packed in the beginning
of the array, otherwise this sounds like a good idea to simplify things.

Regards,
Bjorn
