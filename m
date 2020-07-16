Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FFFD22299C
	for <lists+linux-remoteproc@lfdr.de>; Thu, 16 Jul 2020 19:21:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728937AbgGPRVV (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 16 Jul 2020 13:21:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729444AbgGPRTH (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 16 Jul 2020 13:19:07 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D3D5C08C5CE
        for <linux-remoteproc@vger.kernel.org>; Thu, 16 Jul 2020 10:19:07 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id s26so3984202pfm.4
        for <linux-remoteproc@vger.kernel.org>; Thu, 16 Jul 2020 10:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=PJplWTbP//JWBP6LiwpcydCLM3kpmqRCafKXQ2sO8HM=;
        b=gFZyKus1CsQMXkTyfQNTl5O+0k7AWFHlIkYaZ/5TREymgAeyqVUDm/gqS0BV7rcrsu
         82GmpCSlv26mJYkIfMbStCv9Qy8zBrSoJXare02pYn4LqPE5JgZo1T7UNIT+y5MJDzkg
         61blOixw6uZPHNnqnZo0H1+brKdZsu0on9SNMnH42bxqRCxrCX/yAR8sXJJaheYfKIBL
         mPKSk7Ve24sR4PhSPnJEgbd1z4rD0N4+dAMVEGsd25bCGZwVb5wm2SCKJH8MPXuO4LcS
         7Y8N+rkP9A5ldAquSCD8DeT+G+eh7bmxGOX6VuRMyNnK+XEyu6RgnPXjjyNj+0f8Pmjo
         ahSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PJplWTbP//JWBP6LiwpcydCLM3kpmqRCafKXQ2sO8HM=;
        b=s9q3dq+dhseLsLlxtrIeUCzMOqqK/skoizRgPc0J2cOmZgs/881YfQ2X1CQA1hHaVo
         pbEX0qUifp8+uGnEdQZ80OayHwzQ4dMDLpS9/NZ8HBAkmi97UYy4R1XMFP5ZBCXzuaTT
         EuAgiWZY1BbWJoEoTSTkIX1CZdzWZD5UOAFL3FAtoQekJVY5RhjucsAsHPRdSybHoOXF
         SsXEX8xcq67Pxlw9Mq1qj9VGhmkJONRkeXgCN05riOxmS8trU+CjqQ0DNfIxhfPbCosv
         jd87UJNNi+4KkjavP0l85purDAPeWQRgykf7zLY0QFnfF+SyNzjE5fraIdpv63vwd9kC
         Hgtw==
X-Gm-Message-State: AOAM5304X2E3a2EYnDPA0QAIpYtYDhi2Jg53qAVw+oKOp9va+xjm3VCl
        QJDcSLusO+6nLlhTkQqjGhGMIw==
X-Google-Smtp-Source: ABdhPJwJiFSQcdB6omeWjkDHMF9mbOoLcdHIviL7+KHQY8vyEQkjrY3SKAm2f71bm739lOZkfFQVGw==
X-Received: by 2002:a63:1a44:: with SMTP id a4mr5211817pgm.281.1594919946664;
        Thu, 16 Jul 2020 10:19:06 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id h7sm5551458pfq.15.2020.07.16.10.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 10:19:05 -0700 (PDT)
Date:   Thu, 16 Jul 2020 11:19:03 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Suman Anna <s-anna@ti.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        stefanos@xilinx.com, BLEVINSK@xilinx.com
Subject: Re: [PATCH v2 1/4] dt-bindings: remoteproc: Add bindings for R5F
 subsystem on TI K3 SoCs
Message-ID: <20200716171903.GA3286345@xps15>
References: <20200630024922.32491-1-s-anna@ti.com>
 <20200630024922.32491-2-s-anna@ti.com>
 <20200714171553.GA2522956@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200714171553.GA2522956@bogus>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Rob,

On Tue, Jul 14, 2020 at 11:15:53AM -0600, Rob Herring wrote:
> On Mon, Jun 29, 2020 at 09:49:19PM -0500, Suman Anna wrote:
> > The Texas Instruments K3 family of SoCs have one or more dual-core
> > Arm Cortex R5F processor subsystems/clusters (R5FSS). The clusters
> > can be split between multiple voltage domains as well. Add the device
> > tree bindings document for these R5F subsystem devices. These R5F
> > processors do not have an MMU, and so require fixed memory carveout
> > regions matching the firmware image addresses. The nodes require more
> > than one memory region, with the first memory region used for DMA
> > allocations at runtime. The remaining memory regions are reserved
> > and are used for the loading and running of the R5F remote processors.
> > The R5F processors can also optionally use any internal on-chip SRAM
> > memories either for executing code or using it as fast-access data.
> > 
> > The added example illustrates the DT nodes for the single R5FSS device
> > present on K3 AM65x family of SoCs.
> > 
> > Signed-off-by: Suman Anna <s-anna@ti.com>
> > ---
> > v2:
> >  - Renamed "lockstep-mode" property to "ti,cluster-mode"
> 
> I don't think that's a move in the right direction given this is at 
> least partially a standard feature.
> 
> As I said before, I'm very hesistant to accept anything here given I 
> know the desires and activity to define 'system Devicetrees' of which 
> TI is participating. While maybe an rproc node is sufficient for a 
> DSP, it seems multiple vendors have R cores and want to define them in 
> system DT.
> 
> Though the system DT effort has not yet given any thought to what is the 
> view of one processor or instance to another instance (which is what 
> this binding is). We'll still need something defined for that, but I'd 
> expect that to be dependent on what is defined for system DT.

Efforts related to the definition of the system DT are under way, something I
expect to keep going on for some time to come.  I agree with the need to use the
system DT to define remote processors and I look forward to the time we can do
so.

That being said we need to find a concensus on how to move forward with patches
that are ready to be merged.  What is your opinion on that?

Thanks,
Mathieu 

> 
> Rob
