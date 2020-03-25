Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B55D6192316
	for <lists+linux-remoteproc@lfdr.de>; Wed, 25 Mar 2020 09:46:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727413AbgCYIqB (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 25 Mar 2020 04:46:01 -0400
Received: from mx2.suse.de ([195.135.220.15]:33156 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727316AbgCYIqA (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 25 Mar 2020 04:46:00 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 54F24AFE8;
        Wed, 25 Mar 2020 08:45:58 +0000 (UTC)
Subject: Re: [PATCH v7 2/2] tty: add rpmsg driver
To:     Arnaud Pouliquen <arnaud.pouliquen@st.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Suman Anna <s-anna@ti.com>,
        Fabien DESSENNE <fabien.dessenne@st.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        xiang xiao <xiaoxiang781216@gmail.com>
References: <20200324170407.16470-1-arnaud.pouliquen@st.com>
 <20200324170407.16470-3-arnaud.pouliquen@st.com>
From:   Jiri Slaby <jslaby@suse.cz>
Autocrypt: addr=jslaby@suse.cz; prefer-encrypt=mutual; keydata=
 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
Message-ID: <e458f805-c746-c88e-98f4-d874a7552933@suse.cz>
Date:   Wed, 25 Mar 2020 09:45:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200324170407.16470-3-arnaud.pouliquen@st.com>
Content-Type: text/plain; charset=iso-8859-2
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 24. 03. 20, 18:04, Arnaud Pouliquen wrote:
> --- /dev/null
> +++ b/drivers/tty/rpmsg_tty.c
> @@ -0,0 +1,417 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) STMicroelectronics 2020 - All Rights Reserved
> + * Authors: Arnaud Pouliquen <arnaud.pouliquen@st.com> for STMicroelectronics.
> + */
...
> +typedef void (*rpmsg_tty_rx_cb_t)(struct rpmsg_device *, void *, int, void *,
> +				  u32);

Unused, it seems?

> +static int rpmsg_tty_cb(struct rpmsg_device *rpdev, void *data, int len,
> +			void *priv, u32 src)
> +{
> +	struct rpmsg_tty_port *cport = dev_get_drvdata(&rpdev->dev);
> +	int copied;
> +
> +	if (src == cport->data_dst) {
> +		/* data message */
> +		if (!len)
> +			return -EINVAL;
> +		copied = tty_insert_flip_string_fixed_flag(&cport->port, data,
> +							   TTY_NORMAL, len);

Provided you always pass TTY_NORMAL, why not simply call
tty_insert_flip_string instead?

> +		if (copied != len)
> +			dev_dbg(&rpdev->dev, "trunc buffer: available space is %d\n",
> +				copied);
> +		tty_flip_buffer_push(&cport->port);
> +	} else {
> +		/* control message */
> +		struct rpmsg_tty_ctrl *msg = data;
> +
> +		if (len != sizeof(*msg))
> +			return -EINVAL;
> +
> +		cport->data_dst = msg->d_ept_addr;
> +
> +		/* Update remote cts state */
> +		cport->cts = msg->cts ? 1 : 0;

Number to bool implicit conversion needs no magic, just do:
cport->cts = msg->cts;

> +		if (cport->cts)
> +			tty_port_tty_wakeup(&cport->port);
> +	}
> +
> +	return 0;
> +}
> +
> +static void rpmsg_tty_send_term_ready(struct tty_struct *tty, u8 state)

Should the state be bool? Should it be named "ready" instead?

> +{
> +	struct rpmsg_tty_port *cport = tty->driver_data;
> +	struct rpmsg_tty_ctrl m_ctrl;
> +	int ret;
> +
> +	m_ctrl.cts = state;
> +	m_ctrl.d_ept_addr = cport->d_ept->addr;
> +
> +	ret = rpmsg_trysend(cport->cs_ept, &m_ctrl, sizeof(m_ctrl));
> +	if (ret < 0)
> +		dev_dbg(tty->dev, "cannot send control (%d)\n", ret);
> +};
> +
> +static void rpmsg_tty_throttle(struct tty_struct *tty)
> +{
> +	struct rpmsg_tty_port *cport = tty->driver_data;
> +
> +	/* Disable remote transmission */
> +	if (cport->cs_ept)
> +		rpmsg_tty_send_term_ready(tty, 0);

then s/0/false/;

> +};
> +
> +static void rpmsg_tty_unthrottle(struct tty_struct *tty)
> +{
> +	struct rpmsg_tty_port *cport = tty->driver_data;
> +
> +	/* Enable remote transmission */
> +	if (cport->cs_ept)
> +		rpmsg_tty_send_term_ready(tty, 1);

and s/1/true/;

> +};
...
> +static int rpmsg_tty_write(struct tty_struct *tty, const u8 *buf, int len)
> +{
> +	struct rpmsg_tty_port *cport = tty->driver_data;
> +	struct rpmsg_device *rpdev;
> +	int msg_max_size, msg_size;
> +	int ret;
> +	u8 *tmpbuf;
> +
> +	/* If cts not set, the message is not sent*/
> +	if (!cport->cts)
> +		return 0;
> +
> +	rpdev = cport->rpdev;
> +
> +	dev_dbg(&rpdev->dev, "%s: send msg from tty->index = %d, len = %d\n",
> +		__func__, tty->index, len);
> +
> +	msg_max_size = rpmsg_get_mtu(rpdev->ept);
> +
> +	msg_size = min(len, msg_max_size);
> +	tmpbuf = kzalloc(msg_size, GFP_KERNEL);
> +	if (!tmpbuf)
> +		return -ENOMEM;
> +
> +	memcpy(tmpbuf, buf, msg_size);

This is kmemdup, but why do you do that in the first place?

> +	/*
> +	 * Try to send the message to remote processor, if failed return 0 as
> +	 * no data sent
> +	 */
> +	ret = rpmsg_trysendto(cport->d_ept, tmpbuf, msg_size, cport->data_dst);

data of rpmsg_trysendto is not const. OK, you seem you need to change
that first, I see no blocker for that.

> +	kfree(tmpbuf);
> +	if (ret) {
> +		dev_dbg(&rpdev->dev, "rpmsg_send failed: %d\n", ret);
> +		return 0;
> +	}
> +
> +	return msg_size;
> +}
> +
> +static int rpmsg_tty_write_room(struct tty_struct *tty)
> +{
> +	struct rpmsg_tty_port *cport = tty->driver_data;
> +
> +	return cport->cts ? rpmsg_get_mtu(cport->rpdev->ept) : 0;

With if, this would be more readable, IMO.

> +}
...> +static struct rpmsg_tty_port *rpmsg_tty_alloc_cport(void)
> +{
> +	struct rpmsg_tty_port *cport;
> +
> +	cport = kzalloc(sizeof(*cport), GFP_KERNEL);
> +	if (!cport)
> +		return ERR_PTR(-ENOMEM);
> +
> +	mutex_lock(&idr_lock);
> +	cport->id = idr_alloc(&tty_idr, cport, 0, MAX_TTY_RPMSG, GFP_KERNEL);
> +	mutex_unlock(&idr_lock);
> +
> +	if (cport->id < 0) {
> +		kfree(cport);
> +		return ERR_PTR(-ENOSPC);

You should return ERR_PTR(cport->id) instead. It might be ENOMEM too.

> +	}
> +
> +	return cport;
> +}
...
> +static int rpmsg_tty_port_activate(struct tty_port *p, struct tty_struct *tty)
> +{
> +	p->low_latency = (p->flags & ASYNC_LOW_LATENCY) ? 1 : 0;
> +
> +	/* Allocate the buffer we use for writing data */

Where exactly -- am I missing something?

> +	return tty_port_alloc_xmit_buf(p);
> +}
> +
> +static void rpmsg_tty_port_shutdown(struct tty_port *p)
> +{
> +	/* Free the write buffer */
> +	tty_port_free_xmit_buf(p);
> +}
...
> +static int rpmsg_tty_probe(struct rpmsg_device *rpdev)
> +{
> +	struct rpmsg_tty_port *cport;
> +	struct device *dev = &rpdev->dev;
> +	struct rpmsg_channel_info chinfo;
> +	struct device *tty_dev;
> +	int ret;
> +
> +	cport = rpmsg_tty_alloc_cport();
> +	if (IS_ERR(cport)) {
> +		dev_err(dev, "failed to alloc tty port\n");
> +		return PTR_ERR(cport);
> +	}
> +
> +	if (!strncmp(rpdev->id.name, TTY_CH_NAME_WITH_CTS,
> +		     sizeof(TTY_CH_NAME_WITH_CTS))) {

sizeof of a string feels unnatural, but will work in this case. Can a
compiler optimize strlen of a static string?

> +		/*
> +		 * the default endpoint is used for control. Create a second
> +		 * endpoint for the data that would be exchanges trough control
> +		 * endpoint. address of the data endpoint will be provided with
> +		 * the cts state
> +		 */
> +		cport->cs_ept = rpdev->ept;
> +		cport->data_dst = RPMSG_ADDR_ANY;
> +
> +		strscpy(chinfo.name, TTY_CH_NAME_WITH_CTS, sizeof(chinfo.name));
> +		chinfo.src = RPMSG_ADDR_ANY;
> +		chinfo.dst = RPMSG_ADDR_ANY;
> +
> +		cport->d_ept = rpmsg_create_ept(rpdev, rpmsg_tty_cb, cport,
> +						chinfo);
> +		if (!cport->d_ept) {
> +			dev_err(dev, "failed to create tty control channel\n");
> +			ret = -ENOMEM;
> +			goto err_r_cport;
> +		}
> +		dev_dbg(dev, "%s: creating data endpoint with address %#x\n",
> +			__func__, cport->d_ept->addr);
> +	} else {
> +		/*
> +		 * TTY over rpmsg without CTS management the default endpoint
> +		 * is use for raw data transmission.
> +		 */
> +		cport->cs_ept = NULL;
> +		cport->cts = 1;
> +		cport->d_ept = rpdev->ept;
> +		cport->data_dst = rpdev->dst;
> +	}
> +
> +	tty_port_init(&cport->port);
> +	cport->port.ops = &rpmsg_tty_port_ops;

I expected these two in rpmsg_tty_alloc_cport.

> +
> +	tty_dev = tty_port_register_device(&cport->port, rpmsg_tty_driver,
> +					   cport->id, dev);
> +	if (IS_ERR(tty_dev)) {
> +		dev_err(dev, "failed to register tty port\n");
> +		ret = PTR_ERR(tty_dev);
> +		goto  err_destroy;
> +	}
> +
> +	cport->rpdev = rpdev;
> +
> +	dev_set_drvdata(dev, cport);
> +
> +	dev_dbg(dev, "new channel: 0x%x -> 0x%x : ttyRPMSG%d\n",
> +		rpdev->src, rpdev->dst, cport->id);
> +
> +	return 0;
> +
> +err_destroy:
> +	tty_port_destroy(&cport->port);
> +	if (cport->cs_ept)
> +		rpmsg_destroy_ept(cport->d_ept);
> +err_r_cport:
> +	rpmsg_tty_release_cport(cport);
> +
> +	return ret;
> +}

thanks,
-- 
js
suse labs
