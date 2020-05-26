Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D9B11DD68B
	for <lists+linux-remoteproc@lfdr.de>; Thu, 21 May 2020 21:03:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730074AbgEUTDB (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 21 May 2020 15:03:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729845AbgEUTDA (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 21 May 2020 15:03:00 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4EA5C061A0F
        for <linux-remoteproc@vger.kernel.org>; Thu, 21 May 2020 12:03:00 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id q16so3244809plr.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 21 May 2020 12:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/Oo08/XEB/t5MK/WPQHIyt+1GD6u4ViIKAYuaTKsYvw=;
        b=XkJmPVs3VBunWUwFGskv2JiizITJ/0FqmwEuyWiL8NuZIUNYppwgRbu7Rb+Hm2E4gs
         zosM3pBZbXzLCKpPzbmtSikxf2DTarJCOmR/EEzPuNWeZ04nIMbSHznUGFdJFnENEFlf
         UOsilid7Q6ES9KHq1GOGhq3MvG4hP4NSyBVQIWg3OLDQKQSgT+4YZYyNC3ZovBBupdqg
         CZYux9oUnfoQj1hAK7jqeNM3agFwh72faQDUMnI1ZXd/OFahAbeq+eI2YelRmPKlJbAd
         k0yE9a6XjMQVbrMoh8ahDd06I3eQ1jAv61dsNJECpeQH0yc1PxIUq2Lef+yZ8xG381Fj
         mqXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/Oo08/XEB/t5MK/WPQHIyt+1GD6u4ViIKAYuaTKsYvw=;
        b=dYvnZ1GOI4BmVp9XVkDgv5LRm082TlqiuCzJRmrZCPNzt/Aa0FKcf7Fi8ncoI1qOTG
         Kk+l7Ij9wylPkckLjPMMfplTxcE1XIgKO14NW1GKXhZkQ4eHLNB7XGwlasWJz73MtyEJ
         SF23DZIOQqo5BfCIdIK1sFYHJQaiajJqkMeAmnFK+P+AEM2WF6c0VfPpF2CwXro5J18f
         mamxFwOs2aWCISAY2wbTUdgRVrXE8cJAJpPWhS8ilMC0WIDSra/zrRk8WGGUw7IMJZTb
         rb7WrLJtaqVL9zkCLhEqX07Dn3WWjHo50W+Lop6R9varkDg0rVf68vKNOGSga64wQirU
         f/pQ==
X-Gm-Message-State: AOAM532/TNM3rSVwbejLkJ27cy7+HvT+Ddre7oJo9spEY7gtUIhHWKDI
        +Sv8mld4Ss1q189cWWRF1Cw6KA==
X-Google-Smtp-Source: ABdhPJyja0nFdONVA3qDYEMHATkp/ASlOhFKtHy2PMgx+Quj41sLMb+HVStRwpG6rKRlL3mto4oqhw==
X-Received: by 2002:a17:90a:a590:: with SMTP id b16mr13125461pjq.177.1590087780086;
        Thu, 21 May 2020 12:03:00 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id q9sm4981223pff.62.2020.05.21.12.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 12:02:59 -0700 (PDT)
Date:   Thu, 21 May 2020 12:01:41 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Suman Anna <s-anna@ti.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] TI K3 DSP remoteproc driver for C66x DSPs
Message-ID: <20200521190141.GN408178@builder.lan>
References: <20200521001006.2725-1-s-anna@ti.com>
 <5f84465e-8f63-51b4-4758-59c85d3ad597@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5f84465e-8f63-51b4-4758-59c85d3ad597@ti.com>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu 21 May 11:59 PDT 2020, Suman Anna wrote:

> Hi Bjorn,
> 
> On 5/20/20 7:10 PM, Suman Anna wrote:
> > Hi All,
> > 
> > The following is v2 of the K3 DSP remoteproc driver supporting the C66x DSPs
> > on the TI K3 J721E SoCs. The patches are based on the latest commit on the
> > rproc-next branch, 7dcef3988eed ("remoteproc: Fix an error code in
> > devm_rproc_alloc()").
> 
> I realized I also had the R5F patches on my branch, so the third patch won't
> apply cleanly (conflict on Makefile). Let me know if you want a new revision
> posted for you to pick up the series.
> 

That should be fine, thanks for the heads up!

Will give Mathieu a day or two to take a look as well.

Regards,
Bjorn

> regards
> Suman
> 
> > 
> > v2 includes a new remoteproc core patch (patch 1) that adds an OF helper
> > for parsing the firmware-name property. This is refactored out to avoid
> > replicating the code in various remoteproc drivers. Please see the
> > individual patches for detailed changes.
> > 
> > The main dependent patches from the previous series are now staged in
> > rproc-next branch. The only dependency for this series is the common
> > ti-sci-proc helper between R5 and DSP drivers [1]. Please see the initial
> > cover-letter [2] for v1 details.
> > 
> > regards
> > Suman
> > 
> > [1] https://patchwork.kernel.org/patch/11456379/
> > [2] https://patchwork.kernel.org/cover/11458573/
> > 
> > Suman Anna (4):
> >    remoteproc: Introduce rproc_of_parse_firmware() helper
> >    dt-bindings: remoteproc: Add bindings for C66x DSPs on TI K3 SoCs
> >    remoteproc/k3-dsp: Add a remoteproc driver of K3 C66x DSPs
> >    remoteproc/k3-dsp: Add support for L2RAM loading on C66x DSPs
> > 
> >   .../bindings/remoteproc/ti,k3-dsp-rproc.yaml  | 190 +++++
> >   drivers/remoteproc/Kconfig                    |  13 +
> >   drivers/remoteproc/Makefile                   |   1 +
> >   drivers/remoteproc/remoteproc_core.c          |  23 +
> >   drivers/remoteproc/remoteproc_internal.h      |   2 +
> >   drivers/remoteproc/ti_k3_dsp_remoteproc.c     | 773 ++++++++++++++++++
> >   6 files changed, 1002 insertions(+)
> >   create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
> >   create mode 100644 drivers/remoteproc/ti_k3_dsp_remoteproc.c
> > 
> 
