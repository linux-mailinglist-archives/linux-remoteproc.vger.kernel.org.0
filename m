Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B891A1CEF0
	for <lists+linux-remoteproc@lfdr.de>; Tue, 14 May 2019 20:20:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727580AbfENSUs (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 14 May 2019 14:20:48 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:45406 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727176AbfENSUp (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 14 May 2019 14:20:45 -0400
Received: by mail-ot1-f65.google.com with SMTP id t24so7448395otl.12;
        Tue, 14 May 2019 11:20:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=OKJTOSFDQe74oP+wcypIqwl6MFEVGiVBSsqYDDAQDPc=;
        b=tyP0qVcbiiP5IPGiKeFsyGfh8PyHExTAjgG7lfKL3k37MzDMHgt3rz7aQHhT356H3L
         75LLNTB5ikGawC50MIXEjgIL+8CVCbTQnAkHMMy/JoIO4s968PvICRabKK5tboEgN4PS
         QULkQfHMgsPwRIJMXsp2du5/k9bCgQeNfVrzefgkOny38YCwoCbLZBEBKwlhYbIQ35jB
         ORvZKc4NIGDe5k14Tnjg/bRj1mN3JAoV6+oSRP1XQp97Q+TK3uVXtnMHx0g5IayO7alo
         3HI3nDmnRI+q1hOgtFH3z52ftTXRA/LBvZCTj+paWZg0EVVAxdKUi6Iig+p9ZpqQrTep
         pk8Q==
X-Gm-Message-State: APjAAAXBXkTBCzsryKAX6bbeYUcimsQELwZClqKKk9DWVzr4dgsiEyOx
        esjZu7rfro975TEEiOlAyA==
X-Google-Smtp-Source: APXvYqwo5lRcs0PbbSdUqX0bwV+G31tQy4bJg/f5bK9hHGr5zRLHyV6p4NyvX9B3ICaQkkJ2BwjMkQ==
X-Received: by 2002:a9d:66c3:: with SMTP id t3mr22211827otm.80.1557858044189;
        Tue, 14 May 2019 11:20:44 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id x64sm6771926oia.32.2019.05.14.11.20.43
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 May 2019 11:20:43 -0700 (PDT)
Date:   Tue, 14 May 2019 13:20:42 -0500
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
Subject: Re: [PATCH v4 1/8] dt-bindings: stm32: add bindings for ML-AHB
 interconnect
Message-ID: <20190514182042.GA26928@bogus>
References: <1557822423-22658-1-git-send-email-fabien.dessenne@st.com>
 <1557822423-22658-2-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1557822423-22658-2-git-send-email-fabien.dessenne@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, 14 May 2019 10:26:56 +0200, Fabien Dessenne wrote:
> Document the ML-AHB interconnect for stm32 SoCs.
> 
> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
> ---
>  .../devicetree/bindings/arm/stm32/mlahb.txt        | 37 ++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/stm32/mlahb.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
