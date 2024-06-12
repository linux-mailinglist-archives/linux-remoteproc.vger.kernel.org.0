Return-Path: <linux-remoteproc+bounces-1571-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4006904E2F
	for <lists+linux-remoteproc@lfdr.de>; Wed, 12 Jun 2024 10:32:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E1E728305C
	for <lists+linux-remoteproc@lfdr.de>; Wed, 12 Jun 2024 08:32:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C3FA169ACD;
	Wed, 12 Jun 2024 08:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b="m5fbtJ2R"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9FB45948;
	Wed, 12 Jun 2024 08:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.149.199.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718181153; cv=none; b=snvVz/cPkWpF/yciQht7Vz1Ptf8VZbr7W8CkAI/DNNZth5psEvA0Vem72uBiE+aQvyP7wOYMUwhDFMLyMiYScoErVplcKfDN0vxvIpH/UzBxuULpGakTA14r00JOxSJqq0QYGx88Z5h6/zLux4iNUA/tWoSKiKnh+6X9vmf2fPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718181153; c=relaxed/simple;
	bh=hlkt8qUqaJ32mNpH119vJ7oD4xZ22Clwrh0BnKbUAq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Buh288rkVvcpaNcCDFpWHztt8usvof/OIUF+embiSKf762RFZsGx/H7KiI9Ww1s2Kna1SiJ2Kplsap6JimZyE7mXiEKUitC+LCVlaEifysdfOwbzNQ1tXbqq2KHiPkNA1xxajt7uaKvOX/xQFv7pQtg6vG4sHJN82fXzevGjTSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru; spf=pass smtp.mailfrom=ispras.ru; dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b=m5fbtJ2R; arc=none smtp.client-ip=83.149.199.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ispras.ru
Received: from fedor-21d0 (unknown [5.228.117.145])
	by mail.ispras.ru (Postfix) with ESMTPSA id A64FC40762DE;
	Wed, 12 Jun 2024 08:32:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru A64FC40762DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1718181141;
	bh=5H66dcRSlGQ/cNXt0pE1QJxw6xTn3Ooqy8BWZdp8tQI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m5fbtJ2RtoLg6H+F7g1S3OXAApqdz8bJU42yri4D5CjdfHlSyceSwPHUl/E8c3Zdp
	 vKWQqGzCDLFyacJSTbG/L3iTS6KVbgkR53M45ooLBcAPmkqGOJFOLTvbaKm/lZd2Yp
	 i+U7mOL0IGYZkvFJsMwwPGbbYL6jJgLWilJ0wrIU=
Date: Wed, 12 Jun 2024 11:32:17 +0300
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Aleksandr Mishin <amishin@t-argos.ru>, imx@lists.linux.dev, 
	lvc-project@linuxtesting.org, Shawn Guo <shawnguo@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Oleksij Rempel <o.rempel@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [lvc-project] [PATCH] remoteproc: imx_rproc: Adjust phandle
 parsing issue while remapping optional addresses in imx_rproc_addr_init()
Message-ID: <20240612-d3218ce9809ada564606999e-pchelkin@ispras.ru>
References: <20240606075204.12354-1-amishin@t-argos.ru>
 <ZmcuFRfjKRQG9OXI@p14s>
 <20240610-4fb504648421659114538a50-pchelkin@ispras.ru>
 <Zmh/J0hvTT1Jwvjc@p14s>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Zmh/J0hvTT1Jwvjc@p14s>

On Tue, 11. Jun 10:45, Mathieu Poirier wrote:
> On Mon, Jun 10, 2024 at 08:36:19PM +0300, Fedor Pchelkin wrote:
> > Btw, there is a "rsc-table" node->name check in the the end of the loop
> > body. It was added recently with commit 5e4c1243071d ("remoteproc:
> > imx_rproc: support remote cores booted before Linux Kernel"). Seems to me
> > it forgot that of_node_put() is called way before that.
> > 
> 
> I agree.
> 
> > Also commit 61afafe8b938 ("remoteproc: imx_rproc: Fix refcount leak in
> > imx_rproc_addr_init") was dealing with the last of_node_put() call here
> > but it's still not in the right place I'd say.
> >
> 
> You mean becaue of node->name being used after the last of_node_put() or is

Yes, this one. Only that node->name is used after the last of_node_put().

> there something else?

