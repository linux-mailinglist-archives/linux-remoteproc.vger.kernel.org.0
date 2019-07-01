Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B92C51CEF7
	for <lists+linux-remoteproc@lfdr.de>; Tue, 14 May 2019 20:21:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727612AbfENSVA (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 14 May 2019 14:21:00 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:33098 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727176AbfENSU7 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 14 May 2019 14:20:59 -0400
Received: by mail-oi1-f196.google.com with SMTP id m204so12904473oib.0;
        Tue, 14 May 2019 11:20:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Pw9JQbzKS0a4HXNL7Bkj2dhXDflsHMPuLdGRZTT4jqU=;
        b=NlZ9KzUotdF6SzN2u3FGCMtaki8PynsT9bguVfmlf16shT/QtL5wJM5dUHZT+vQRvc
         l3a0uuJbLD34RdDFZwAtjCx9w4EXCvF503QQOebgugi+JYTS1lLEPx8LBdRxHTTEbV92
         EIoBzvyvzlVUJ9s+VgGO5Mfim0qqTnve5L1gXNyrEZsGOi86TkdfROLnVs8rjF6QuSu2
         TWjJAsCNCnz9pPC3I6mySi8R6zi43htWlYDMWCZZsMcC1FKp1QW4uCOUfwjzfMhX4n2G
         lsICisDSuwDNN/W31e6/WpL+uhAiXVcJbIV5dHIbLLD4hYzI0T0Oc7qhABp8PgAR2NY5
         9dsQ==
X-Gm-Message-State: APjAAAXqFZfQ0q40dD2Y0qezNvRKTG4zUtnCXmoVbhkZFZLiFe/DIvz6
        HT/mFFZuAVQUBZ7R5YF57w==
X-Google-Smtp-Source: APXvYqxZeCsZUomLSIAJ/MyTJbnDCD5r2MgFiIhPMfVTTg2CPXMGsQkk5wZZ/VGWG2FzDkYqmDF21Q==
X-Received: by 2002:aca:7297:: with SMTP id p145mr4065474oic.87.1557858058769;
        Tue, 14 May 2019 11:20:58 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n95sm4392204otn.73.2019.05.14.11.20.58
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 May 2019 11:20:58 -0700 (PDT)
Date:   Tue, 14 May 2019 13:20:57 -0500
From:   Rob Herring <robh@kernel.org>
To:     Fabien Dessenne <fabien.dessenne@st.com>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Fabien Dessenne <fabien.dessenne@st.com>,
        Loic Pallardy <loic.pallardy@st.com>,
        Arnaud Pouliquen <arnaud.pouliquen@st.com>,
        Ludovic Barre <ludovic.barre@st.com>,
        Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: Re: [PATCH v4 2/8] dt-bindings: remoteproc: add bindings for stm32
 remote processor driver
Message-ID: <20190514182057.GA27475@bogus>
References: <1557822423-22658-1-git-send-email-fabien.dessenne@st.com>
 <1557822423-22658-3-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1557822423-22658-3-git-send-email-fabien.dessenne@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, 14 May 2019 10:26:57 +0200, Fabien Dessenne wrote:
> Add the device tree bindings document for the stm32 remoteproc devices.
> 
> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
> ---
>  .../devicetree/bindings/remoteproc/stm32-rproc.txt | 63 ++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/stm32-rproc.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
