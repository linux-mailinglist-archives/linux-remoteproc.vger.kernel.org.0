Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F5FB1B4D78
	for <lists+linux-remoteproc@lfdr.de>; Wed, 22 Apr 2020 21:38:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726081AbgDVTiW (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 22 Apr 2020 15:38:22 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:36386 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725924AbgDVTiW (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 22 Apr 2020 15:38:22 -0400
Received: by mail-oi1-f193.google.com with SMTP id s202so2954472oih.3;
        Wed, 22 Apr 2020 12:38:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=r+bQz+oywLIfBY+qmz5dtgdjHfJr24roK+Q4M23wujE=;
        b=VdQUNazYj0GYdBcUIACHIbMInWEb1oC4lWSukKdihJy1WY17f1ArTVWyNq0cYnJJOW
         kzxhBFadrP2uo06xStn+SWa5CqcV9JZpre4C8zA2hU4a4MNocveIhyOBjRhCHvqwtXiQ
         S1pC0Ba2LcMcuDM+jyLhMMaKnJ2f0Q1+MnDXn6Pmizv4Q0HbsbK5m/iUpbu4WO7ghaG4
         GEk3i/23TITeO84DQisdHFXkLtCvdS0k9ihn/zSdrF3lbTqDD1mD4HUXdcG7t3WkrflZ
         LbvXbKG9CKuTNaskKGDBxiGwMtOCucls/LqhL4lWKHG08T6DpzJvLjR8lvmAhqV0qAZG
         vrsQ==
X-Gm-Message-State: AGi0PuYk/zBYNCaCZIxWDnEyxROKJk4VinJL36UZXWaRnEkmr0QXPuAB
        ZbhSJPLHCq2SKOck/3cvNA==
X-Google-Smtp-Source: APiQypI14oeR06dFErUfwCsPEufwOtD3gkatiqcxhF0Yrwf5FslPbZlGF7qdSUieoA3OewdCEeZm0g==
X-Received: by 2002:aca:440a:: with SMTP id r10mr415199oia.139.1587584301584;
        Wed, 22 Apr 2020 12:38:21 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 80sm17588otd.35.2020.04.22.12.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2020 12:38:20 -0700 (PDT)
Received: (nullmailer pid 2056 invoked by uid 1000);
        Wed, 22 Apr 2020 19:38:19 -0000
Date:   Wed, 22 Apr 2020 14:38:19 -0500
From:   Rob Herring <robh@kernel.org>
To:     Ben Levinsky <ben.levinsky@xilinx.com>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        michal.simek@xilinx.com, jollys@xilinx.com, rajan.vaja@xilinx.com,
        robh+dt@kernel.org, mark.rutland@arm.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jason Wu <j.wu@xilinx.com>,
        Wendy Liang <jliang@xilinx.com>
Subject: Re: [PATCH v3 4/5] dt-bindings: remoteproc: Add documentation for
 ZynqMP R5 rproc bindings
Message-ID: <20200422193819.GA1685@bogus>
References: <1587421629-914-1-git-send-email-ben.levinsky@xilinx.com>
 <1587421629-914-5-git-send-email-ben.levinsky@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1587421629-914-5-git-send-email-ben.levinsky@xilinx.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, 20 Apr 2020 15:27:08 -0700, Ben Levinsky wrote:
> Add binding for ZynqMP R5 OpenAMP.
> 
> Represent the RPU domain resources in one device node. Each RPU
> processor is a subnode of the top RPU domain node.
> 
> Signed-off-by: Ben Levinsky <ben.levinsky@xilinx.com>
> Signed-off-by: Jason Wu <j.wu@xilinx.com>
> Signed-off-by: Wendy Liang <jliang@xilinx.com>
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> ---
> Changes since v2:
> 	- update zynqmp_r5 yaml parsing to not raise warnings for extra
> 	 information in children of R5 node. The warning "node has a unit
> 	 name, but no reg or ranges property" will still be raised though 
> 	 as this particular node is needed to describe the
> 	 '#address-cells' and '#size-cells' information.
> ---
>  .../remoteproc/xilinx,zynqmp-r5-remoteproc.yaml    | 126 +++++++++++++++++++++
>  1 file changed, 126 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.example.dts:45.25-65.16: Warning (unit_address_vs_reg): /example-0/rpu@ff9a0000/r5@0: node has a unit name, but no reg or ranges property

See https://patchwork.ozlabs.org/patch/1273784

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.
