Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E49265ACF3
	for <lists+linux-remoteproc@lfdr.de>; Sat, 29 Jun 2019 20:57:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726882AbfF2S5q (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Sat, 29 Jun 2019 14:57:46 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:47047 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726942AbfF2S5q (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 29 Jun 2019 14:57:46 -0400
Received: by mail-pl1-f193.google.com with SMTP id e5so5044134pls.13
        for <linux-remoteproc@vger.kernel.org>; Sat, 29 Jun 2019 11:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=0uwyMT5kJax/pL1jOjeLm1qOkWd4WLOXSR140tRuxek=;
        b=qN+7iBT07Kph9Rpi4qRmEYDRkGQSIyxa1AWRbuJoBD/GGBsgzv9EMLYZuBaybUkJPO
         928wSxRDL9iLFs9beRDmk8SaNEj3mGyQoCN7bE8qbp0hRGLUAfTX7PO6m6uhB/LAPom0
         TQELEMAje8JWX3kYiW+M6fYbdopJBNzBmmR8zBYEgM++zeqmSrZ1abMqRZ2OenGZhzI1
         gyy/JljHBQug3tZ4WsdRuG/p7M+K0GDWCHc6SOIJ074oBQxeF0BExI23iJ+SsrzdI7Xw
         QcVf9q9vK77QxtQhJFRE8WFu7fXDtBlF4j68xMnYVLdherYFN0d4Df39R19oivkg49qW
         0MdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0uwyMT5kJax/pL1jOjeLm1qOkWd4WLOXSR140tRuxek=;
        b=Fxd1HwaiJl+naqB6HVE8FJrFUoWZHvPTY76xnqfdTcDg71oOueZy/xOvK80Ay8s8Lj
         jsAHv6ByoMxyAnLw4aR+ltV9yWFs4CGoTL30ky6rhPMY8055YHzf8CM/UBEUmaPipjp1
         9JBwmJzcMEa7gTIkyAa5zPR/oIC3TS7Nwa6N/XPGBHh+zIqHsTXmMGfbm44g/BmCipwj
         KY02n9RfsVggKJZE+mPqUIAenQS4YkBK+ri6HMU8QOzJynPcYKiCI9XoAqvkFprtp/cA
         3meBU39F2X98h1oaa9sLVxRyCVTWzziO+pUYb6NVWCL1So75YZMSH2Uy8qd7NyaKUwDq
         PSUw==
X-Gm-Message-State: APjAAAXscGPSZRh6gT+PnQS/e/33/R5KDZBYwHyHQ3Rpu4ffBYcNvgKN
        RPgsMa9ZLrfAsyk2WruyBeNnlg==
X-Google-Smtp-Source: APXvYqw9J7xQauFQr3WOlY6Dt3tYd3yx0nLfr/60YZFabkrGW26ZmmZkZYy/tKhQ/MO/onltwhqghg==
X-Received: by 2002:a17:902:9688:: with SMTP id n8mr18660494plp.227.1561834665686;
        Sat, 29 Jun 2019 11:57:45 -0700 (PDT)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id s129sm5781898pfb.186.2019.06.29.11.57.44
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 29 Jun 2019 11:57:44 -0700 (PDT)
Date:   Sat, 29 Jun 2019 11:57:42 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Suman Anna <s-anna@ti.com>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH 0/3] Add HwSpinlock support for TI K3 SoCs
Message-ID: <20190629185742.GC23094@builder>
References: <20190531021321.14025-1-s-anna@ti.com>
 <90211f72-7ce4-94e5-aef7-bbe14266dfbb@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <90211f72-7ce4-94e5-aef7-bbe14266dfbb@ti.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon 24 Jun 13:38 PDT 2019, Suman Anna wrote:

> Hi Bjorn,
> 

Hi Suman,

> On 5/30/19 9:13 PM, Suman Anna wrote:
> > Hi Bjorn,
> > 
> > The following series adds the support for the HwSpinlock IP present
> > on the newer TI K3 AM65x and J721E SoCs. The first 2 patches are
> > related to the K3 support, and the last patch is a minor debug related
> > trace to see the number of locks registered on each SoC.
> > 
> > I will be posting the DT nodes once the binding is acked.
> 
> If you do not have any comments, can you please pick up this series for
> 5.3 merge window?
> 

I was waiting for Rob's ack on the dt change, but as it's just a minor
modification I've merged the series.

Thanks,
Bjorn

> Thanks,
> Suman
> 
> > 
> > regards
> > Suman
> > 
> > Suman Anna (3):
> >   dt-bindings: hwlock: Update OMAP binding for TI K3 SoCs
> >   hwspinlock/omap: Add support for TI K3 SoCs
> >   hwspinlock/omap: Add a trace during probe
> > 
> >  .../bindings/hwlock/omap-hwspinlock.txt       | 25 +++++++++++++++----
> >  drivers/hwspinlock/Kconfig                    |  2 +-
> >  drivers/hwspinlock/omap_hwspinlock.c          |  4 +++
> >  3 files changed, 25 insertions(+), 6 deletions(-)
> > 
> 
